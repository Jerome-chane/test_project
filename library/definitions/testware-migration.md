---
name: testware-migration
version: 1
extractors: text, csharp, git, projects
taxonomy: testware-v0
allowWriteInsideTarget: no
---

# testware-migration

Everything needed to write the tests of an existing end-to-end framework again on the TestWare core, per source repository: stack facts, every page object with its actions and a draft page set per application (`PAGES.md`), every test file with its scenarios, data and preconditions (`TESTS.md`), and one mapping per infrastructure file saying which TestWare slot it lands in and what it does today (`slots/`: engines, configuration, reporters, steps, helpers). On top of that, one plan cell per slot and a per-repo map with gaps (`plan/`, `MIGRATION.md`) for when a full migration is planned; skip the steps `plan` and `map` in the job until then.

Run it on each source repository with its own alias. Outputs go to `{{data}}/migration/<alias>/`, outside any repository. The per-repo outputs are then read by a capable model with the prompts in `docs/migration-unify.md`: the first prompt builds the test-authoring kit per repository, the second the cross-repository migration plan.

## Routes

- out: `{{data}}/migration/{{repo.alias}}`

## Variables

- purpose: This repository is one of several existing frameworks being merged into one shared core. Describe what it does and how it maps onto the core; do not propose refactors of this repository.
- target: The target core is TestWare. A test project ships a TestConfig.json with named Scopes; each Scope has a ScopeName, a CoreName naming an engine kind, and a Config object with that engine's settings; CockpitScopes do the same for reporters. An Engine (ITestWareEngine) owns one driver or session, with Initialize, Dispose, CollectEvidence returning a screenshot path, and StartRecordingEvidences/StopRecordingEvidences; Selenium and Playwright engines exist. A Cockpit (ITestWareCockpit) is a reporter with Start/Stop for suite, case and step, and activities that attach files. Pages are engine-neutral interfaces with one implementation per engine, listed per application in a page set interface; tests ask for a page by its interface. A test marks its scope with [TestWareScopes("name")]; a shared test base starts the scope's engine before each test and disposes it after. Named steps with before/after/error hooks come from a StepChain. There is no slot yet for test data, HTTP or database helpers, retries, parallel runs, result merging, Appium server start-up or multiple sessions in one test.

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

Infrastructure and configuration files: which TestWare slot each lands in, with disposition, what to keep and what to change. The filter is wide on purpose: a missed engine or reporter costs more than a few TW.NONE records.

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
- against: members, types, configKeys
- onMiss: reject

### Writers

- migration-slot → `{{routes.out}}/slots/{{file.relpath}}.md`

## Step: pages

Every page, screen or dialog object: application, actions, driver access, suggested interface name.

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

Every test file: its scenarios, pages, data, preconditions, sessions, and what it needs from the test base. Not sampled: these are the tests to write again.

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

## Step: plan

One plan cell per slot: approach, ordered work, risks, gap (model), from the slot records.

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

Page list per application with a draft page set.

- kind: index
- from: pages
- groupBy: `result.application`

### Writers

- migration-pages-index → `{{routes.out}}/PAGES.md`

## Step: tests-index

Every test file with its scenarios, and what the test base must provide.

- kind: index
- from: tests

### Writers

- migration-tests-index → `{{routes.out}}/TESTS.md`

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
