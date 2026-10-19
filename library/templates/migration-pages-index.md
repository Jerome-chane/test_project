# Pages — {{repo.alias}}

Rebuilt {{now}} from {{count}} page record(s), grouped by application. Each row becomes one `[Service]` class whose constructor takes the engine interface in the Engine column; a page that exists on several platforms also gets the interface in the Interface column, with one implementation per platform chosen with `[Pages]`. Details per page in `pages/<path>.md`.
{{#each groups}}

## {{#if key}}{{key}}{{else}}(no application){{/if}} — {{count}} page(s)

| Page file | Class to write | Engine | Interface | Platforms | Driver access today | Actions |
|---|---|---|---|---|---|---|
{{#each records}}
| [{{facts.name}}](pages/{{subject}}.md) | `{{result.pageName}}Page` | {{result.engine}} | `{{result.interfaceName}}` | {{join result.platforms ", "}} | {{result.driverAccess}} | {{count result.actions}} |
{{/each}}

What each page must let a test do, as the old file names it. These are the behaviours the new class offers; its shape comes from the TestWare sample, not from the old file:

{{#each records}}
- `{{result.interfaceName}}`: {{join result.actions ", "}}
{{/each}}
{{/each}}
