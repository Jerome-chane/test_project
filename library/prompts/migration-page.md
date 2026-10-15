---
name: migration-page
version: 1
answer: migration-page
temperature: 0
system: You inventory page objects of a test-automation framework so they can be re-declared as page interfaces with one implementation per engine. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: Inventory of one page or screen object: application, actions, driver access, suggested interface name.
---
# Task

{{vars.purpose}}

Below is ONE page, screen or dialog object. In the target core, every page becomes an engine-neutral interface (for example `ILoginPage`) with one implementation per engine, and the interfaces of one application are listed in that application's page set. Describe this page so the interface can be written from your answer.

# Target core

{{vars.target}}

# Fixed values

{{taxonomyText}}

# Rules

- actions: the public members a test would call, as named in the file. Leave out constructors, private helpers and locator fields.
- pageName: the page's short name without a Page/Screen suffix, such as Login or Checkout.
- interfaceName: `I` + pageName + `Page` unless the file already uses another convention.
- application: the application or area the page belongs to, from the namespace or folder, as one PascalCase word (SwagLabs, Billing).
- notes: only what a migrator needs: business logic inside the page, platform branches, hard sleeps, duplication with other pages.

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
