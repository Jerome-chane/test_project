---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Application: {{result.application}}
Interface: {{result.interfaceName}}
Platforms: {{join result.platforms ", "}}
Model: {{model}}
---
# {{file.relpath}}

| Aspect | Value |
|---|---|
| Application | {{result.application}} |
| Page set property | `{{result.interfaceName}} {{result.pageName}} { get; }` |
| Platforms | {{join result.platforms ", "}} |
| Driver access | {{result.driverAccess}} |
| Locators in file | {{result.locatorsInline}} |
| Waits inside | {{result.waitsInside}} |
| Locator kinds (script) | {{pairs facts.locators}} |
| Sleeps / empty catches (script) | {{facts.markers.sleep}} / {{facts.markers.emptyCatch}} |

## Actions

{{#each result.actions}}
- {{.}}
{{/each}}
{{#if result.navigatesTo}}

Navigates to: {{join result.navigatesTo ", "}}
{{/if}}
{{#if result.notes}}

## Notes

{{#each result.notes}}
- {{.}}
{{/each}}
{{/if}}
