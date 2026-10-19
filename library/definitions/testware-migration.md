---
name: testware-migration
version: 3
extractors: text, csharp, git, projects
taxonomy: testware-v0
allowWriteInsideTarget: no
---

# testware-migration

Everything needed to write the tests of an existing end-to-end framework again on the TestWare core, per source repository: stack facts (`facts.md`), every page object with its actions and the `[Service]` class to write for it (`PAGES.md`), every test file with its scenarios, data, preconditions and the platform it needs (`TESTS.md`), every Gherkin feature with its scenarios (`FEATURES.md`), and one mapping per infrastructure file saying which TestWare slot it lands in and what it does today (`slots/`: platforms, engines, settings, steps, services, helpers). On top of that, one plan cell per slot and a per-repo map with gaps (`plan/`, `MIGRATION.md`), and a `HANDOFF.md` that says which files to give a capable model and which prompt turns them into a migration plan an agent can execute.

Run it on each source repository with its own alias. Outputs go to `{{data}}/migration/<alias>/`, outside any repository. The local model works file by file; the synthesis is done by a capable model with the prompt in `HANDOFF.md` (also in `docs/migration-unify.md` of this project). The steps `plan` and `map` can be skipped in the job until a full migration is planned; the first-test plan does not need them.

## Routes

- out: `{{data}}/migration/{{repo.alias}}`

## Variables

- purpose: This repository is one of several existing end-to-end test frameworks whose tests will be written again on one shared core. Describe what the file does and how it maps onto the core; do not propose refactors of this repository.
- target: The target core is TestWare, a .NET 8 library for NUnit 4 and MSTest 4. Where a test runs is a platform, a named entry in testware.json with an Engine (Selenium, Playwright, Http or Appium, or a custom engine class marked [Engine]) and that engine's settings (BaseUrl, Browser, Headless, RemoteUrl, Os, DeviceName, App, Headers, Lifetime); environments add testware.<Environment>.json, and any key can be overridden by a TESTWARE__ environment variable. A page is a class marked [Service] whose constructor takes one engine interface (ISeleniumEngine, IPlaywrightEngine, IHttpEngine, IAppiumEngine) and uses the engine's helpers (Find, Click, Type, IsVisible, IsGone, WaitUntil; Send for Http); the same page on several platforms is an interface with one implementation per platform, chosen with [Pages]. A service is a [Service] class without an engine (test users, data builders, clocks). A test class derives from TestWareFixture, names its platforms with [Platforms] or a [TestFixture] argument, and takes pages, engines and services as parameters of the test method; it can also call Page<T>(), Engine<T>(), Service<T>(), Settings<T>("Section"), Step("name", action) and OnCleanup(action). TestWare starts the engines before each test and stops them after, captures a screenshot or the last request and response when a test or a step fails and attaches them to the result, runs tests in parallel with one container scope per test, and checks the configuration at start-up. A Startup class (TestWareSetUpFixture in NUnit, TestWareStartup in MSTest) registers classes from other libraries in ConfigureServices. There is no slot for reporters, report portals, retries, Gherkin step definitions, or database and messaging helpers; those stay in the project or in the pipeline.

## Select

- maxChars: 300000
- skipGenerated: yes
- skipVendored: yes
- skipBinary: yes

### Include

- `**/*.cs`
- `**/*.feature`
- `**/*.csproj`
- `**/*.props`
- `**/Directory.*.props`
- `**/appsettings*.json`
- `**/*.runsettings`
- `**/App.config`
- `**/*.yml`
- `**/*.yaml`
- `**/*.json`
- `**/README*`
- `**/*.ps1`
- `**/Jenkinsfile`

### Exclude

- `**/bin/**`
- `**/obj/**`
- `**/node_modules/**`
- `**/.git/**`
- `**/.vs/**`
- `**/.idea/**`
- `**/packages/**`
- `**/TestResults/**`
- `**/dist/**`
- `**/build/**`
- `**/*.lock`
- `**/package-lock.json`
- `**/*.min.*`
- `**/launchSettings.json`
- `**/*.Designer.cs`
- `**/*.feature.cs`

### Generated

- `**/*.feature.cs`
- `**/*.Designer.cs`
- `**/*.g.cs`
- `**/*.g.i.cs`
- `**/*.generated.*`

## Budget

- maxPromptChars: 44000
- fullFileMaxChars: 12000
- charsPerToken: 4.9

## Step: facts

Deterministic stack sheet: frameworks, packages, runners, driver libraries, config keys, hot files. No model.

- kind: index

### Writers

- inventory-facts → `{{routes.out}}/facts.md`

## Step: slots

Infrastructure and configuration files: which TestWare slot each lands in, with disposition, what to keep and what to change. The filter is wide on purpose: a missed driver factory or configuration file costs more than a few TW.NONE records.

- kind: perFile
- prompt: migration-slot
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Filter: all

- binary missing
- lang in csharp, json, yaml, xml, msbuild
- layer in core, config, other
- chars >= 80

### Filter: any

- infraScore >= 1
- hooks >= 1
- markers.driverCreation >= 1
- markers.configRead >= 1
- subclassCount >= 1
- callerFiles >= 2
- bases exists
- configKeys exists

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, imports, hooks, attributes, configKeys, platformHints, subclasses, callers, locators, markers, infraScore, codeMode
- neighbors: yes
- taxonomy: yes

### Grounding

- fields: slots[].evidence
- against: members, types, configKeys, references, calls
- onMiss: reject

### Writers

- migration-slot → `{{routes.out}}/slots/{{file.relpath}}.md`

## Step: pages

Every page, screen, dialog or API client object: application, actions, driver access, the engine its TestWare class will take, suggested interface name.

- kind: perFile
- prompt: migration-page
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Filter: all

- binary missing
- layer = page-object
- chars >= 200

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, locators, markers, platformHints, codeMode
- neighbors: yes
- taxonomy: yes

### Grounding

- fields: actions
- against: members
- onMiss: drop

### Writers

- migration-page → `{{routes.out}}/pages/{{file.relpath}}.md`

## Step: tests

Every test file: its scenarios, pages, data, preconditions, sessions, the platform it needs, and what it relies on the test base for. Not sampled: these are the tests to write again.

- kind: perFile
- prompt: migration-test
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Filter: all

- binary missing
- layer = test
- lang = csharp
- chars >= 200

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, hooks, attributes, testMarkers, platformHints, codeMode
- neighbors: no
- taxonomy: yes

### Grounding

- fields: bases
- against: bases
- onMiss: drop

### Writers

- migration-test → `{{routes.out}}/tests/{{file.relpath}}.md`

## Step: features

Every Gherkin feature file: its scenarios, background, tags and the screens its steps mention. TestWare has no Gherkin runner, so these scenarios are written again as test methods.

- kind: perFile
- prompt: migration-feature
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Filter: all

- binary missing
- lang = gherkin
- chars >= 80

### Inputs

- code: yes
- facts: relpath, lang, scenarios, steps, tags, codeMode
- neighbors: no
- taxonomy: yes

### Writers

- migration-feature → `{{routes.out}}/features/{{file.relpath}}.md`

## Step: plan

One plan cell per slot: approach, ordered work, risks, gap (model), from the slot records. Needed for a full migration, not for the first test.

- kind: aggregate
- prompt: migration-plan
- from: slots
- groupBy: `result.slots[].id`
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Inputs

- code: no
- neighbors: no
- taxonomy: yes

### Writers

- migration-plan → `{{routes.out}}/plan/{{slug group.key}}.md`

## Step: map

The per-repo migration map: slot table with gaps, slots nobody claimed, stack summary.

- kind: index
- from: plan

### Writers

- migration-index → `{{routes.out}}/MIGRATION.md`

## Step: pages-index

Page list per application with the draft interface and the [Service] class to write for each page.

- kind: index
- from: pages
- groupBy: `result.application`

### Writers

- migration-pages-index → `{{routes.out}}/PAGES.md`

## Step: tests-index

Every test file with its scenarios, the platform the tests need, and what the test base must provide.

- kind: index
- from: tests

### Writers

- migration-tests-index → `{{routes.out}}/TESTS.md`

## Step: features-index

Every feature file with its scenarios, grouped by application.

- kind: index
- from: features
- groupBy: `result.application`

### Writers

- migration-features-index → `{{routes.out}}/FEATURES.md`

## Step: handoff

The hand-off page for the capable model: which files of this folder and of the TestWare repository to attach, the test files to choose the first test from, and the prompt that turns them into a migration plan an agent can execute. Rebuilt from the test records; no model.

- kind: index
- from: tests

### Writers

- migration-handoff → `{{routes.out}}/HANDOFF.md`

## Step: review

Re-check 10% of slot records against the source.

- kind: review
- prompt: inventory-review
- from: slots
- key: hash, promptVersion, taxonomyVersion
- sampleRate: 0.1
- minDays: 7
- retries: 1

### Inputs

- code: yes
- facts: relpath, lang, types, members
- neighbors: no
- taxonomy: yes
