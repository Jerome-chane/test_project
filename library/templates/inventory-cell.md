---
Capability: {{group.key}}
Repo: {{repo.alias}}
Files: {{group.count}}
Completeness: {{result.completeness}}
Analysed: {{today}}
---
# {{group.key}} — {{repo.alias}}

**Completeness:** {{result.completeness}} · **Files:** {{group.count}}

{{result.approach}}
{{#if result.strengths}}

## Keep

{{#each result.strengths}}
- {{.}}
{{/each}}
{{/if}}
{{#if result.weaknesses}}

## Avoid

{{#each result.weaknesses}}
- {{.}}
{{/each}}
{{/if}}

## Files

{{#each group.records}}
- `{{file}}`{{#each result.capabilities}}{{#if mechanism}} — {{role}} ({{join platforms ", "}}): {{mechanism}}{{/if}}{{/each}}
{{/each}}
