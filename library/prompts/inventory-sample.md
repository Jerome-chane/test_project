---
name: inventory-sample
version: 2
answer: inventory-sample
temperature: 0
system: You describe how a page object or a test file is written, using fixed choices. You answer in markdown, in exactly the requested sections.
description: How one sampled page object / test file is written (pattern, waits inside, assertions inside, platform branching, data access).
---
# Task

{{vars.purpose}}

Below is ONE page object, step-definition or test file. Describe how it is written, choosing from the fixed values. This is evidence of how the framework is used, not a review of the file.

# Choices

{{taxonomyText}}

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

# File

```{{file.lang}}
{{code}}
```
