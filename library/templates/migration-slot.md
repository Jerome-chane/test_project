---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Layer: {{facts.layer}}
Slots: {{#each result.slots}}{{id}}{{#unless @last}}, {{/unless}}{{/each}}
Model: {{model}}
---
# {{file.relpath}}

{{result.summary}}

- Types: {{join facts.types ", "}}
- Inherits: {{join facts.bases ", "}}
- Inherited by {{count neighbors.subclasses}} file(s); used by {{count neighbors.callers}} file(s)
{{#if facts.hooks}}- Hooks: {{join facts.hooks ", "}}
{{/if}}{{#if facts.configKeys}}- Config keys (script): {{join facts.configKeys ", "}}
{{/if}}
{{#each result.slots}}

## {{id}} — {{disposition}}, {{effort}} ({{join platforms ", "}})

{{what}}

- Evidence: {{join evidence ", "}}
{{#if keep}}- Keep: {{join keep " · "}}
{{/if}}{{#if change}}- Change: {{join change " · "}}
{{/if}}{{#if configKeys}}- Config keys: {{join configKeys ", "}}
{{/if}}{{#if depends}}- Depends on: {{join depends ", "}}
{{/if}}
{{/each}}
