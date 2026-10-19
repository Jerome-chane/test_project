---
name: migration-feature
version: 1
answer: migration-feature
temperature: 0
system: You inventory Gherkin feature files so their scenarios can be written again as plain test methods on a target core. You answer in markdown, in exactly the requested sections, and you never invent names that are not in the file.
description: The scenarios, background, tags and screens of one Gherkin feature file.
---
# Task

{{vars.purpose}}

Below is ONE Gherkin feature file. The target core has no Gherkin runner: every scenario becomes a test method that takes pages as parameters, and the steps become calls on those pages or named steps. List what this file holds so the test methods can be written from your answer.

# Target core

{{vars.target}}

# Fixed values

{{taxonomyText}}

# Rules

- application: the application or area the feature belongs to, from the folder or the feature title, as one PascalCase word.
- scenarios: one line per Scenario or Scenario Outline, `Name: what it checks`, in the file's order. An Outline is one line naming the variation.
- background: the Background steps, one per line, as preconditions the test methods must establish.
- pagesImplied: the screens, pages or endpoints the steps mention, as short names.
- platforms: where the scenarios run, from the tags or the steps; web when nothing says otherwise.

# Answer format

{{answerForm}}

# Facts

- Path: {{file.relpath}}  ({{file.lang}}{{#if codeMode}}, shown as {{codeMode}}{{/if}})
{{#if facts.scenarios}}
- Scenarios counted: {{facts.scenarios}} · steps: {{facts.steps}}
{{/if}}
{{#if facts.tags}}
- Tags: {{pairs facts.tags}}
{{/if}}

# File

```gherkin
{{code}}
```
