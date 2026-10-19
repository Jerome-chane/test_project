---
name: testware-v0
version: 2
---

# testware-v0

Vocabulary for mapping an existing end-to-end framework onto the TestWare core: where each piece lands (slot), what happens to it (disposition), how much work it is, and which TestWare engine serves it. Version 2 follows the current core: platforms in `testware.json`, `[Service]` pages with one engine interface, `TestWareFixture` tests with pages as parameters, built-in evidence. Bump `version` when you change a slot so the affected records re-run.

## Slots

| Id | Group | Description |
|---|---|---|
| TW.PLATFORM | core | Driver, browser, device, API client or environment settings that become one platform entry in testware.json: an Engine name (Selenium, Playwright, Http, Appium or a custom engine) plus that engine's keys such as BaseUrl, Browser, Headless, RemoteUrl, Os, DeviceName, App, Headers, Lifetime |
| TW.SETTINGS | core | Other configuration tests or pages read: users, test data, tenant ids, URLs per stage, feature switches: becomes a section of testware.json read with Settings<T> or by a service; per-environment values go to testware.<Environment>.json, secrets to TESTWARE__ environment variables |
| TW.ENGINE | platform | Creating, starting and closing a driver, browser, device session or HTTP client: replaced by a built-in engine (Selenium, Playwright, Http, Appium) or rewritten as a custom engine class with Start, Stop and Capture, an [Engine("Name")] attribute and a settings class |
| TW.ENGINE.EXT | platform | Extras on top of a session: network capture, device logs, video, app reset, context or tab switching, cookies: becomes a helper on the engine's driver, an extension method of the engine interface, or the Capture of a custom engine |
| TW.REPORT | core | Reporting: HTML reports, report portals, result mapping, test management upload: no TestWare slot; results come from dotnet test --logger trx with the evidence attached, the rest stays in the pipeline or is dropped |
| TW.EVIDENCE | core | Screenshots, page source, logs, request and response captured on failure or per step: built into TestWare, which captures from every engine when a test or a Step fails and attaches the files to the result; only custom evidence remains, in the Capture of a custom engine |
| TW.PAGE | platform | A page, screen, dialog or API client object of the application under test: becomes a [Service] class whose constructor takes one engine interface (ISeleniumEngine, IPlaywrightEngine, IHttpEngine, IAppiumEngine); the same page on several platforms is an interface with one implementation per platform, chosen with [Pages] |
| TW.PAGE.BASE | platform | Page base classes, element wrappers, locator helpers, waits, retries around actions: replaced by the engine helpers (Find, Click, Type, IsVisible, IsGone, WaitUntil; Send for Http); what the helpers do not cover becomes an extension method of the engine interface in the project |
| TW.TESTBASE | core | Test base classes and lifecycle hooks (one-time setup, per-test setup and teardown): replaced by TestWareFixture and the Startup class; what remains goes to OnSessionStarted and OnTestFinished overrides, OnCleanup, or a [Service] |
| TW.TEST | core | Test classes and fixtures: kept, re-pointed to [Platforms("name")] or a [TestFixture("name")] argument, with pages, engines and services as parameters of the test method |
| TW.STEPS | core | Named steps, actions or business flows between tests and pages (login, navigation, checkout): becomes Step("name", ...) in the test or a [Service] action class that takes pages |
| TW.SERVICE | core | Test users, data builders, generators, seeding, clocks, shared state: becomes a [Service] class (Scoped per test or Singleton for the run) that reads Settings<T> where it needs configuration; cleanup is registered with OnCleanup |
| TW.UTIL | core | Helpers for databases, messaging, files, dates: no TestWare slot; carried as [Service] classes or static helpers in the project; HTTP calls to the application under test move to an Http platform and a page |
| TW.RUN | core | Retries, parallelism, test selection, result merging, pipeline scripts, server start-up: parallel runs are built in (one container scope per test); the rest stays with the runner and the pipeline (filters, --logger trx, TESTWARE_ENVIRONMENT and TESTWARE__ variables) |
| TW.BDD | core | Gherkin features, step definitions and SpecFlow or Reqnroll hooks: no TestWare slot; scenarios are written again as test methods, step definitions become Step calls or action services |
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

## Engines

- selenium
- playwright
- http
- appium
- custom
- none

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
