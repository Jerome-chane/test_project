---
Slot: {{group.key}}
Repo: {{repo.alias}}
Files: {{group.count}}
Gap: {{result.gap}}
Analysed: {{today}}
---
# {{group.key}} — {{repo.alias}}

**Files:** {{group.count}} · **Gap in the core:** {{result.gap}}

{{result.approach}}

## Work

{{#each result.work}}
1. {{.}}
{{/each}}
{{#if result.risks}}

## Risks

{{#each result.risks}}
- {{.}}
{{/each}}
{{/if}}
{{#if result.gapDetail}}

## What the core must gain

{{result.gapDetail}}
{{/if}}

## Files

{{#each group.records}}
- `{{file}}`{{#each result.slots}}{{#if what}} — {{disposition}}, {{effort}} ({{join platforms ", "}}): {{what}}{{/if}}{{/each}}
{{/each}}
