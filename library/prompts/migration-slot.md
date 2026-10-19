---
name: migration-slot
version: 2
answer: migration-slot
temperature: 0
system: You map infrastructure files of a test-automation framework onto the slots of a target core framework. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: Which target slot(s) one infrastructure file lands in, with disposition, what to keep, what to change, evidence.
---
# Task

{{vars.purpose}}

Read ONE infrastructure or configuration file of an existing test-automation framework and say where it lands in the target core described below: which slot, whether it is reused, adapted, rewritten, a gap or dropped, what behaviour must survive, and what must change.

# Target core

{{vars.target}}

# Slots and fixed values

{{taxonomyText}}

# Rules

- One `## Slot` section per slot the file maps onto. Most files map onto one. A file that creates drivers and also reads their settings maps onto TW.ENGINE and TW.PLATFORM. A configuration file with driver settings and test data maps onto TW.PLATFORM and TW.SETTINGS.
- disposition: reuse when the code can move as is; adapt when it needs small edits to fit the slot; rewrite when the behaviour is needed but the code must be written anew in the slot; drop when the core already does it (driver start and stop, screenshots on failure, parallel isolation) or it is not needed; gap when the core has no place for it and the behaviour is still needed.
- keep: behaviour the migrated version must still have, taken from this file. change: what must change to fit the slot. Both concrete, both from this file.
- evidence: member, type or configuration key names FROM THIS FILE, exactly as listed below. Claims without real evidence are rejected.
- configKeys: names only, never values. For TW.PLATFORM, list the keys that become platform settings (base address, browser, headless, remote address, device, app, timeouts).
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
{{#if facts.configKeys}}
- Config keys: {{join facts.configKeys ", "}}
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
