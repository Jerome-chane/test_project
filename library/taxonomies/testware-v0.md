---
name: testware-v0
version: 1
---

# testware-v0

Vocabulary for mapping an existing end-to-end framework onto the TestWare core: where each piece lands (slot), what happens to it (disposition), how much work it is. Bump `version` when you change a slot so the affected records re-run.

## Slots

| Id | Group | Description |
|---|---|---|
| TW.CONFIG.SCOPE | core | Driver or environment settings that become one Scope entry (ScopeName, CoreName, Config) in TestConfig.json |
| TW.CONFIG.OTHER | core | Configuration with no place in TestConfig.json today: environments, secrets, URLs per stage, feature switches |
| TW.ENGINE | platform | Creating, starting and closing a driver, browser, device session or API client: becomes an ITestWareEngine, or a subclass of the Selenium or Playwright engine |
| TW.ENGINE.EXT | platform | Extras on top of a session: network capture, device logs, video, app reset, context switching: becomes engine members or StartRecordingEvidences/StopRecordingEvidences |
| TW.COCKPIT | core | Reporting: HTML reports, report portals, TRX, result mapping: becomes an ITestWareCockpit |
| TW.EVIDENCE | core | Screenshots, page source, logs attached on failure or per step: becomes CollectEvidence plus cockpit activities |
| TW.PAGE | platform | A page, screen or dialog object of the application under test: becomes a page interface plus one implementation per engine, listed in the application's page set |
| TW.PAGE.BASE | platform | Page base classes, element wrappers, locator helpers, waits: becomes extension methods of the engine or a PageBase in the application project |
| TW.TESTBASE | core | Test base classes and lifecycle hooks (one-time setup, per-test setup and teardown): becomes the TestWare test base for the runner |
| TW.TEST | core | Test classes and fixtures: kept, re-pointed to [TestWareScopes] and Page<T>() |
| TW.STEPS | core | Named steps, actions or business flows between tests and pages: becomes a StepChain subclass or an Actions layer |
| TW.DATA | core | Test data: files, builders, generators, seeding: no TestWare slot today |
| TW.UTIL | core | Helpers for HTTP, databases, messaging, files, dates: no TestWare slot today, carried in the application project |
| TW.RUN | core | Retries, parallelism, test selection, result merging, pipeline scripts, server start-up: runner and pipeline concerns outside TestWare |
| TW.NONE | core | Nothing to migrate: dead code, generated code, samples, tooling |

## Dispositions

- reuse
- adapt
- rewrite
- gap
- drop

## Effort

- small
- medium
- large

## Platforms

- shared
- web
- android
- ios
- mobile
- windows-desktop
- api
- other

## Runners

- nunit
- mstest
- xunit
- specflow
- reqnroll
- other

## Driver access

- driver-direct
- base-class
- wrapper
- none

## Data sources

- attributes
- literals
- external-file
- builder
- service
- none

## Sessions

- single
- multiple
- none
