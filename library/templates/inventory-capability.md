---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Layer: {{facts.layer}}
InfraScore: {{facts.infraScore}}
Capabilities: {{#each result.capabilities}}{{id}}{{#unless @last}}, {{/unless}}{{/each}}
Model: {{model}}
---
# {{file.relpath}}

{{result.summary}}

- Types: {{join facts.types ", "}}
- Inherits: {{join facts.bases ", "}}
- Inherited by {{count neighbors.subclasses}} file(s); used by {{count neighbors.callers}} file(s)
{{#if facts.hooks}}- Hooks: {{join facts.hooks ", "}}
{{/if}}{{#if facts.markers}}- Markers: sleeps {{facts.markers.sleep}}, empty catches {{facts.markers.emptyCatch}}, static mutable {{facts.markers.staticMutable}}, waits {{facts.markers.waits}}, driver creation {{facts.markers.driverCreation}}
{{/if}}
{{#each result.capabilities}}

## {{id}} — {{role}} ({{join platforms ", "}})

{{mechanism}}

- Evidence: {{join evidence ", "}}
{{#if configKeys}}- Config keys: {{join configKeys ", "}}
{{/if}}{{#if external}}- External: {{join external ", "}}
{{/if}}{{#if notable}}- Notable: {{join notable " · "}}
{{/if}}{{#if concerns}}- Concerns: {{join concerns " · "}}
{{/if}}
{{else}}

_No capability from the vocabulary applies to this file._
{{/each}}
