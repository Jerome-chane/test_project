---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Application: {{result.application}}
Interface: {{result.interfaceName}}
Engine: {{result.engine}}
Platforms: {{join result.platforms ", "}}
Model: {{model}}
---
# {{file.relpath}}

| Aspect | Value |
|---|---|
| Application | {{result.application}} |
| Class to write | `[Service] {{result.pageName}}Page` with one engine interface in its constructor |
| Engine | {{result.engine}} |
| Interface (several platforms) | `{{result.interfaceName}}` |
| Platforms | {{join result.platforms ", "}} |
| Driver access today | {{result.driverAccess}} |
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
