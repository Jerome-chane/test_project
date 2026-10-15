# Tests — {{repo.alias}}

Rebuilt {{now}} from {{count}} test file record(s). The scenarios below are the tests to write again on the target core. Details per file in `tests/<path>.md`.

| Test file | Runner | Scenarios | Pages used | Sessions | Data | Scope needed |
|---|---|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](tests/{{subject}}.md) | {{result.runner}} | {{count result.scenarios}} | {{join result.pagesUsed ", "}} | {{result.sessions}} | {{result.dataSource}} | {{truncate result.scopeHint 60}} |
{{/each}}

## Scenarios
{{#each records}}

### {{facts.name}}

{{#each result.scenarios}}
- {{.}}
{{/each}}
{{#if result.preconditions}}
Preconditions: {{join result.preconditions "; "}}
{{/if}}
{{/each}}

## What the test base must provide

{{#each records}}
{{#each result.needs}}
- {{.}} (`{{../facts.name}}`)
{{/each}}
{{/each}}
