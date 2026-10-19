# Tests — {{repo.alias}}

Rebuilt {{now}} from {{count}} test file record(s). The scenarios below are the tests to write again on the target core. The first test to write is the one with one session, the fewest pages, no seeded data and no device. Details per file in `tests/<path>.md`.

| Test file | Runner | Scenarios | Pages used | Sessions | Data | Target engine | Platform needed |
|---|---|---|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](tests/{{subject}}.md) | {{result.runner}} | {{count result.scenarios}} | {{join result.pagesUsed ", "}} | {{result.sessions}} | {{result.dataSource}} | {{result.engine}} | {{truncate result.platformHint 60}} |
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
