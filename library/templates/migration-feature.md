---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Application: {{result.application}}
Platforms: {{join result.platforms ", "}}
Model: {{model}}
---
# {{file.relpath}}

| Aspect | Value |
|---|---|
| Application | {{result.application}} |
| Platforms | {{join result.platforms ", "}} |
| Tags | {{join result.tags ", "}} |
| Pages implied | {{join result.pagesImplied ", "}} |
| Scenarios / steps (script) | {{facts.scenarios}} / {{facts.steps}} |

## Scenarios

{{#each result.scenarios}}
- {{.}}
{{/each}}
{{#if result.background}}

## Background (preconditions)

{{#each result.background}}
- {{.}}
{{/each}}
{{/if}}
{{#if result.notes}}

## Notes

{{#each result.notes}}
- {{.}}
{{/each}}
{{/if}}
