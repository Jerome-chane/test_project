---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Runner: {{result.runner}}
Platforms: {{join result.platforms ", "}}
Model: {{model}}
---
# {{file.relpath}}

| Aspect | Value |
|---|---|
| Runner | {{result.runner}} |
| Base classes | {{join result.bases ", "}} |
| Hooks used | {{join result.hooksUsed ", "}} |
| Data source | {{result.dataSource}} |
| Sessions per test | {{result.sessions}} |
| Platforms | {{join result.platforms ", "}} |
| Scope needed | {{result.scopeHint}} |
| Pages used | {{join result.pagesUsed ", "}} |

## Scenarios

{{#each result.scenarios}}
- {{.}}
{{/each}}
{{#if result.preconditions}}

## Preconditions

{{#each result.preconditions}}
- {{.}}
{{/each}}
{{/if}}

## Needs from the test base

{{#each result.needs}}
- {{.}}
{{/each}}
{{#if result.notes}}

## Notes

{{#each result.notes}}
- {{.}}
{{/each}}
{{/if}}
