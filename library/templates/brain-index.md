# Brain index — {{repo.alias}}

Goal: {{vars.goal}}

Rebuilt {{now}} from {{count}} note(s). Read a note before touching its file; the `Source:` header is the file it describes.
Notes live under `knowledge/files/<path>.md`.
{{#each groups}}

## {{#if key}}{{key}}{{else}}(root){{/if}} — {{count}} file(s)

| File | Summary | Learned | Flag |
|---|---|---|---|
{{#each records}}
| [{{facts.name}}](knowledge/files/{{subject}}.md) | {{truncate result.summary 160}} | {{time}} | {{#if flagged}}review{{/if}} |
{{/each}}
{{/each}}
