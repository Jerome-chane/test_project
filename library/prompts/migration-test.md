---
name: migration-test
version: 1
answer: migration-test
temperature: 0
system: You describe how a test file is wired to its framework, so a new test base can provide the same services. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: What one test file tests and how it is wired, so the same tests can be written on the target core.
---
# Task

{{vars.purpose}}

Below is ONE test file. Its tests will be written again on the target core, where a test says which configured scope it runs in with an attribute, gets its engine started and stopped by a shared test base, and asks that base for pages. List what this file tests and what it relies on today.

# Target core

{{vars.target}}

# Fixed values

{{taxonomyText}}

# Rules

- scenarios: one line per test method, `Name: what it checks`, in the file's order. Parameterised tests are one line naming the variation.
- preconditions: what must already be true when a test starts, taken from setup code, attributes or the first steps.
- bases and hooksUsed: names as written in the file.
- scopeHint: the driver or environment configuration this file needs, in words: which browser, device, app, environment or API base.
- needs: what the base class or hooks do for this file: start a driver, log in, seed data, take screenshots, retry, clean up. One per line.
- Do not review the tests. Describe the wiring.

# Answer format

{{answerForm}}

# Facts

- Path: {{file.relpath}}  ({{file.lang}}, layer {{facts.layer}}{{#if codeMode}}, shown as {{codeMode}}{{/if}})
- Types: {{join facts.types ", "}}; inherits {{join facts.bases ", "}}
- Members: {{join facts.members ", "}}
{{#if facts.hooks}}
- Hooks: {{join facts.hooks ", "}}
{{/if}}
{{#if facts.attributes}}
- Attributes: {{join facts.attributes ", "}}
{{/if}}
{{#if facts.testMarkers}}
- Test markers: {{join facts.testMarkers ", "}}
{{/if}}
{{#if facts.platformHints}}
- Platform hints: {{join facts.platformHints ", "}}
{{/if}}

# File

```{{file.lang}}
{{code}}
```
