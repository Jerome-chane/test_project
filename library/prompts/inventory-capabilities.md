---
name: inventory-capabilities
version: 2
answer: inventory-capabilities
temperature: 0
system: You classify infrastructure files of test-automation frameworks into a fixed vocabulary. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: Which capabilities one infrastructure file implements, with evidence members, config keys and concerns.
---
# Task

{{vars.purpose}}

Read ONE infrastructure file of a test-automation framework and say which capabilities it implements, extends, configures or uses, in the vocabulary below. Several capabilities per file are normal; none is possible for a plain utility.

# Vocabulary (use these ids exactly; anything else is OTHER:<short-name>)

{{taxonomyText}}

# Rules

- role: implements (the mechanism lives here), extends (adds to a mechanism elsewhere), configures (settings only), uses (calls it).
- mechanism: how it is done, concrete (names of classes, libraries, patterns).
- evidence: member or type names FROM THIS FILE, exactly as listed under Members and Types below. Claims without real evidence are rejected.
- configKeys: names only, never values.
- Do not describe the platform library itself (Selenium, Appium, Playwright); describe what THIS file adds on top.

# Answer format

{{answerForm}}

# Facts (extracted by script; the file text follows)

- Path: {{file.relpath}}  ({{file.lang}}, layer {{facts.layer}}, infra score {{facts.infraScore}}{{#if codeMode}}, shown as {{codeMode}}{{/if}})
- Types: {{join facts.types ", "}}
- Base types / interfaces: {{join facts.bases ", "}}
- Members: {{join facts.members ", "}}
- Imports: {{join facts.imports ", "}}
{{#if facts.hooks}}
- Hooks: {{join facts.hooks ", "}}
{{/if}}
{{#if facts.attributes}}
- Attributes: {{join facts.attributes ", "}}
{{/if}}
{{#if facts.platformHints}}
- Platform hints: {{join facts.platformHints ", "}}
{{/if}}
{{#if facts.locators}}
- Locator kinds used: {{pairs facts.locators}}
{{/if}}
{{#if facts.markers}}
- Markers: {{pairs facts.markers}}
{{/if}}
{{#if neighbors.subclasses}}
- Inherited by: {{join neighbors.subclasses ", "}}
{{/if}}
{{#if neighbors.callers}}
- Used by: {{join neighbors.callers ", "}}
{{/if}}

# File

```{{file.lang}}
{{code}}
```
