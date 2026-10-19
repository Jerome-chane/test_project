# Features — {{repo.alias}}

Rebuilt {{now}} from {{count}} feature file record(s), grouped by application. The target core has no Gherkin runner: every scenario below becomes a test method, its Background the preconditions that method establishes first. Details per file in `features/<path>.md`.
{{#each groups}}

## {{#if key}}{{key}}{{else}}(no application){{/if}} — {{count}} feature(s)

| Feature file | Scenarios | Platforms | Pages implied | Tags |
|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](features/{{subject}}.md) | {{count result.scenarios}} | {{join result.platforms ", "}} | {{join result.pagesImplied ", "}} | {{join result.tags ", "}} |
{{/each}}
{{#each records}}

### {{facts.name}}

{{#each result.scenarios}}
- {{.}}
{{/each}}
{{#if result.background}}
Background: {{join result.background "; "}}
{{/if}}
{{/each}}
{{/each}}
