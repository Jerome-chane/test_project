# Pages — {{repo.alias}}

Rebuilt {{now}} from {{count}} page record(s), grouped by application. Each row becomes one page interface and one property in the application's page set. Details per page in `pages/<path>.md`.
{{#each groups}}

## {{#if key}}{{key}}{{else}}(no application){{/if}} — {{count}} page(s)

Draft page set `I{{#if key}}{{key}}{{else}}App{{/if}}Pages`, one property per page:

{{#each records}}
- `{{result.interfaceName}} {{result.pageName}} { get; }`
{{/each}}

| Page file | Property | Platforms | Driver access | Actions |
|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](pages/{{subject}}.md) | `{{result.pageName}}` | {{join result.platforms ", "}} | {{result.driverAccess}} | {{count result.actions}} |
{{/each}}
{{/each}}
