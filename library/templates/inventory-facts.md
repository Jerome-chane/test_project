# Stack facts — {{repo.alias}}

Extracted by script on {{now}} (no model involved). Names and versions only; no values, no step text.

## Size

- Files analysed: {{facts.files}} · characters: {{facts.chars}} · binary skipped: {{facts.binaryFiles}} · generated skipped: {{facts.generatedFiles}} · vendored skipped: {{facts.vendoredFiles}}
- Languages: {{#each facts.languages}}{{@key}} {{.}}{{#unless @last}}, {{/unless}}{{/each}}
- Platform hints (files): {{#each facts.platformHints}}{{@key}} {{.}}{{#unless @last}}, {{/unless}}{{/each}}
{{#if facts.git}}
- Git: {{facts.commits}} commits, {{facts.firstCommit}} → {{facts.lastCommit}}, HEAD {{facts.commit}}
{{/if}}

## .NET projects ({{facts.projectCount}})

| Project | TFM | Output | Test | Packages | References |
|---|---|---|---|---|---|
{{#each facts.projects}}
| {{name}} | {{join targetFrameworks ", "}} | {{outputType}} | {{isTestProject}} | {{count packages}} | {{join projectReferences ", "}} |
{{/each}}

- Target frameworks: {{#each facts.targetFrameworks}}{{@key}} ({{.}}){{#unless @last}}, {{/unless}}{{/each}}
- Test runners: {{join facts.testRunners ", "}}
- BDD: {{join facts.bdd ", "}}
- Driver libraries: {{join facts.driverLibraries ", "}}

## Packages

| Package | Version(s) |
|---|---|
{{#each facts.packages}}
| {{@key}} | {{.}} |
{{/each}}
{{#if facts.manifests}}

## Other manifests

{{#each facts.manifests}}
- `{{@key}}`: {{join . ", "}}
{{/each}}
{{/if}}

## Gherkin

- Features: {{facts.gherkin.features}} · scenarios: {{facts.gherkin.scenarios}} · steps: {{facts.gherkin.steps}}
- Tags: {{#each facts.gherkin.tags}}{{@key}} ({{.}}){{#unless @last}}, {{/unless}}{{/each}}

## Locator kinds (all files)

{{#each facts.locatorKinds}}
- {{@key}}: {{.}}
{{else}}
- none found
{{/each}}

## Framework calls from page objects and tests (top)

{{#each facts.usageCalls}}
- {{@key}}: {{.}}
{{else}}
- none found
{{/each}}

## Configuration

- Config files: {{join facts.configFiles ", "}}
- Keys ({{count facts.configKeys}}): {{join facts.configKeys ", "}}

## CI

{{#each facts.ciFiles}}
- {{.}}
{{else}}
- none found
{{/each}}
{{#if facts.git}}

## Activity

- Most changed files: {{join facts.hotFiles ", "}}
- Files with flaky/workaround/timeout/retry commits: {{join facts.keywordFiles ", "}}
{{/if}}
