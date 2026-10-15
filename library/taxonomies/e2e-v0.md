---
name: e2e-v0
version: 1
---

# e2e-v0

Fixed vocabulary for inventorying end-to-end test automation frameworks before merging them into one. Review and extend; bump 'version' when you do so the affected records are re-run.

## Capabilities

| Id | Group | Description |
|---|---|---|
| CFG.ENV | core | Environments, configuration layering and overrides (files, env vars, run settings) |
| CFG.SECRETS | core | Credentials and secrets: where they come from and how they reach the tests |
| DATA.SOURCE | core | Test data sources: files, builders, databases, services |
| DATA.BIND | core | How test data is bound to tests or steps (tables, attributes, injection) |
| DATA.SEED | core | Set-up and clean-up of data through APIs or databases before/after tests |
| DATA.GEN | core | Generated or randomised test data |
| CTX.SHARE | core | Sharing state between steps, classes or scenarios (scenario context, DI containers) |
| LIFE.HOOKS | core | Lifecycle hooks: before/after run, feature, scenario, step, test |
| RUN.PARALLEL | core | Parallel execution and thread safety |
| RUN.SELECT | core | Selecting what runs: tags, categories, filters, run lists |
| RUN.RETRY | core | Retrying failed tests, steps or actions |
| ASSERT | core | Assertion style and libraries, soft assertions |
| LOG | core | Logging during runs |
| REPORT | core | Reports and report portals (HTML, Allure, Extent, TRX, JUnit XML) |
| EVIDENCE | core | Screenshots, video, page source, device logs, network captures on failure |
| INT.CI | core | Integration with CI pipelines |
| INT.TESTMGMT | core | Integration with test management or issue tracking |
| UTIL.API | core | HTTP/API helpers used by the tests |
| UTIL.DB | core | Database access helpers |
| UTIL.MESSAGING | core | Email, SMS, OTP or message-queue helpers |
| UTIL.FILES | core | File, download and upload helpers |
| DRV.CREATE | platform | Creating a driver/browser/session: local, remote grid, cloud |
| DRV.LIFECYCLE | platform | Driver reuse, quit, crash recovery, per-test vs per-run sessions |
| DRV.OPTIONS | platform | Capabilities and options per browser/device/app |
| DRV.INFRA | platform | Driver binaries, Appium server, grid or device-farm infrastructure |
| ELEM.LOCATE | platform | Locator strategies and how locators are declared |
| ELEM.WRAP | platform | Element wrappers/controls with their own actions |
| SYNC.WAIT | platform | Waits and synchronisation (explicit, implicit, polling, hard sleeps) |
| ACT.INPUT | platform | Typing, clicking, selecting, keyboard |
| ACT.GESTURE | platform | Touch gestures, scrolling, swiping, drag and drop |
| NAV.CONTEXT | platform | Windows, tabs, frames, web views, alerts, native/web context switching |
| APP.LIFECYCLE | platform | Installing, launching, resetting, backgrounding the app; deep links; permissions |
| DEVICE | platform | Device or desktop-machine specifics: orientation, settings, clipboard, notifications |
| POM.BASE | platform | Page-object/screen-object base classes and conventions |
| POM.XPLAT | platform | One page/screen abstraction with an implementation per platform |

## Platforms

- shared
- web
- android
- ios
- mobile
- windows-desktop
- api
- other

## Roles

- implements
- extends
- configures
- uses

## Patterns

- element-properties
- locator-constants
- action-methods
- fluent-navigation
- component-composed
- other

## Platform branching

- none
- runtime-if
- separate-classes
- shared-interface
- attribute-per-platform

## Data access

- literals
- config
- injected-model
- data-builder
- none
