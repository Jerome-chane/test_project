# Hand-off — {{repo.alias}}

Rebuilt {{now}} from {{count}} test file record(s). This page turns the outputs of this folder into a migration plan that an AI coding agent can execute on its own: give a capable model the files listed below and the prompt at the end, as it stands. Everything in this folder was written from the source code, file by file; the model must use only what the files say about the project.

## 1. Files to attach from this folder

- `facts.md`: the stack (runner, driver libraries, projects, configuration files).
- `PAGES.md`: every page object, the class to write for it and its actions.
- `TESTS.md`: every test file with its scenarios, preconditions and the platform it needs.
- `FEATURES.md`: every Gherkin feature with its scenarios, when the project has any.
- `slots/*.md`: the per-file records. Attach every record whose front matter lists TW.PLATFORM, TW.ENGINE, TW.ENGINE.EXT, TW.SETTINGS, TW.TESTBASE, TW.STEPS, TW.SERVICE or TW.UTIL. The others (TW.REPORT, TW.RUN, TW.NONE) are only needed for the full migration.
- `MIGRATION.md` and `plan/*.md`, when the job ran the `plan` and `map` steps.

## 2. Files to attach from the TestWare repository

- `README.md`
- `docs/core-concepts.md`
- `docs/ramp-up.md` (step 2 is the minimal test project; the last section is how to brief an assistant)
- `docs/reference.md` (a test project in five files, the MSTest variant, the migration notes)
- `docs/dependency-injection.md` and `docs/attributes.md`
- `docs/demos.md`, so the plan can name the sample closest to each file
- `src/TestWare/Engines/<Engine>/README.md` for every engine named in the Target engine column below

## 3. Test files to choose the first test from

The first test is the one with one session, the fewest pages, no seeded data and no device.

| Test file | Scenarios | Pages used | Sessions | Data | Target engine | Platform needed |
|---|---|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](tests/{{subject}}.md) | {{count result.scenarios}} | {{count result.pagesUsed}} | {{result.sessions}} | {{result.dataSource}} | {{result.engine}} | {{truncate result.platformHint 60}} |
{{/each}}

## 4. The prompt

Paste it as written, then attach the files of sections 1 and 2. The answer is the plan; save it next to this file as `PLAN.md` and hand it to the agent together with the TestWare repository.

~~~~
You are writing the migration plan that an AI coding agent will execute, unattended, on a developer's laptop: it will write the first tests of one existing end-to-end project again on the shared core framework TestWare, and run them green. The agent has the TestWare repository and the old project's repository on disk, the .NET 8 SDK, and the browsers TestWare's setup script installs. It has not read either repository; your plan is all it gets, together with the TestWare documentation the plan names.

Attached, for the project (named by its alias): the stack facts (facts.md), the page inventory (PAGES.md), the test inventory with scenarios (TESTS.md), the Gherkin features if any (FEATURES.md) and the per-file records of its infrastructure (slots/*.md). From TestWare: README.md, docs/core-concepts.md, docs/ramp-up.md, docs/reference.md, docs/dependency-injection.md, docs/attributes.md, docs/demos.md and the engine guides. Every statement in the project's files was produced from its source code, file by file; use only what they say about the project. Everything about TestWare comes from its documentation; do not invent members, attributes or settings keys.

Write one markdown document titled "Migration plan — <alias>: first tests on TestWare", with these sections in this order.

1. Preconditions on the machine. What must be true before the agent starts: the .NET 8 SDK, TestWare cloned and its setup script run green, the browser, device or server each platform of section 2 needs, network access to the application under test, credentials present as environment variables (names only). One checkable line each.

2. Platforms to configure. One row per driver, browser, device or API configuration the project uses, from the TW.PLATFORM and TW.ENGINE records and the "Platform needed" column of TESTS.md: the platform name to use in testware.json (Engine_purpose, for example Selenium_web), the TestWare engine, the engine keys to set with the old project's file and key they come from (names, never values), the lifetime (Scoped, or Singleton with the reason), and whether a secret must come from a TESTWARE__ variable. Say when no built-in engine serves a configuration and a custom engine would be needed; that configuration is out of scope for the first tests.

3. The first test. One scenario from TESTS.md or FEATURES.md, chosen because it needs one session, the fewest pages, no seeded data and no device: the test file and the scenario line as the record wrote them, its platform(s) from section 2, and the pages it needs. Then the next two candidates in the same form.

4. Files to create. One subsection per file, in creation order, each with its path under the new test project: the project file (NUnit or MSTest as the project uses today, the package names, the TestWare adapter project reference, the Using aliases, the testware.json copy item); Startup.cs; testware.json with the platforms of section 2 that the first test needs, keys with placeholders and never values; one page class per page of section 3 (the [Service] attribute, the engine interface its constructor takes, the behaviours the page must offer as the actions of PAGES.md describe them, the TestWare sample to copy the pattern from); the test class (the [Platforms] attribute, the test method with pages as parameters, the checks the scenario makes). Give declarations and member names, not full bodies; the agent writes the bodies from the samples you name. The old project is not the model: its base classes, helpers, waits, naming and folder layout are not carried over, and a page or test is shaped like the TestWare sample, not like the old file. The scenario is what survives: what it checks, with which data and preconditions.

5. Commands, in order. Each with its expected outcome: dotnet build, dotnet test with a filter for the first test, and what a start-up error looks like when a platform key is wrong. Then the same for the next two candidates.

6. Done when. Checkable lines: the first test passes, the evidence folder holds a screenshot or a request log after a forced failure, the skipped count is explained, the diff touches only the new project.

7. Rules for the agent. Do not change the TestWare core. Do not change the old project. Every page carries [Service] and takes exactly one engine interface. Pages and tests copy the samples named in section 4, never the old project's files. Platform names and keys are only those written in testware.json. Data a test creates is undone with OnCleanup on the next line. No new ChromeDriver(), new HttpClient(), Playwright.CreateAsync() or Thread.Sleep in pages or tests. When the agent meets something this plan does not cover, it stops and reports instead of guessing.

8. After the first tests. The remaining scenarios of TESTS.md and FEATURES.md grouped by the pages they need, in the order that adds the fewest new pages each time; the slots marked gap or drop, with the reason; the open questions for the project's owners, as questions, not answers.

Rules: name files, types, members and keys exactly as the records and the TestWare documentation name them; no values of secrets or URLs; mark anything inferred with "Inferred:"; no praise; the plan must be executable top to bottom without asking anyone. The plan covers the first tests in one minimal test project; it proposes no folder layout, naming scheme, shared project or suite structure for the migrated solution, because that is decided later for all solutions together.
~~~~
