---
name: migration-page
version: 2
answer: migration-page
temperature: 0
system: You inventory page objects of a test-automation framework so they can be written again as page classes of a target core, one engine interface per page. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: Inventory of one page, screen or API client object: application, actions, driver access, the engine its new class will take, suggested interface name.
---
# Task

{{vars.purpose}}

Below is ONE page, screen, dialog or API client object. In the target core, a page becomes a class marked [Service] whose constructor takes one engine interface, and a page that exists on several platforms becomes an interface (for example `ILoginPage`) with one implementation per platform. Describe this page so the class, and its interface when needed, can be written from your answer.

# Target core

{{vars.target}}

# Fixed values

{{taxonomyText}}

# Rules

- actions: the public members a test would call, as named in the file. Leave out constructors, private helpers and locator fields.
- pageName: the page's short name without a Page/Screen suffix, such as Login or Checkout.
- interfaceName: `I` + pageName + `Page` unless the file already uses another convention.
- application: the application or area the page belongs to, from the namespace or folder, as one PascalCase word (SwagLabs, Billing).
- engine: the engine interface the new class will take: selenium for WebDriver pages, playwright for Playwright pages, appium for mobile screens, http for API clients, custom when the driver is something else, none when the file reaches no driver.
- notes: only what a migrator needs: business logic inside the page, platform branches, hard sleeps, duplication with other pages, members that need something the engine helpers do not offer.

# Answer format

{{answerForm}}

# Facts

- Path: {{file.relpath}}  ({{file.lang}}, layer {{facts.layer}}{{#if codeMode}}, shown as {{codeMode}}{{/if}})
- Types: {{join facts.types ", "}}; inherits {{join facts.bases ", "}}
- Members: {{join facts.members ", "}}
{{#if facts.locators}}
- Locator kinds: {{pairs facts.locators}}
{{/if}}
{{#if facts.markers}}
- Markers: {{pairs facts.markers}}
{{/if}}
{{#if facts.platformHints}}
- Platform hints: {{join facts.platformHints ", "}}
{{/if}}
{{#if neighbors.callers}}
- Used by: {{join neighbors.callers ", "}}
{{/if}}

# File

```{{file.lang}}
{{code}}
```
