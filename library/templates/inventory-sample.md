---
Source: {{file.relpath}}
Repo: {{repo.alias}}
Hash: {{file.hash}}
Analysed: {{today}}
Kind: {{result.kind}}
Platforms: {{join result.platforms ", "}}
Model: {{model}}
---
# {{file.relpath}}

| Aspect | Value |
|---|---|
| Kind | {{result.kind}} |
| Platforms | {{join result.platforms ", "}} |
| Pattern | {{result.pattern}} |
| Platform branching | {{result.platformBranching}} |
| Data access | {{result.dataAccess}} |
| Waits inside | {{result.waitsInside}} |
| Assertions inside | {{result.assertionsInside}} |
| Locator kinds (script) | {{pairs facts.locators}} |
| Sleeps / empty catches (script) | {{facts.markers.sleep}} / {{facts.markers.emptyCatch}} |

Framework calls: {{join result.frameworkCalls ", "}}
{{#if result.observations}}

## Observations

{{#each result.observations}}
- {{.}}
{{/each}}
{{/if}}
