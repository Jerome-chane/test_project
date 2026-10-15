# Export draft — {{repo.alias}}

Only aliases, capability ids, fixed-list values and counts. No paths, no type or member names, no free text from the model.
Edit before sharing; this is a draft.

| Capability | Completeness | Files |
|---|---|---|
{{#each records}}
| {{subject}} | {{result.completeness}} | {{count result.files}} |
{{/each}}

- Capabilities claimed: {{count}}
- Target frameworks: {{#each facts.targetFrameworks}}{{@key}}{{#unless @last}}, {{/unless}}{{/each}}
- Test runners: {{join facts.testRunners ", "}} · BDD: {{join facts.bdd ", "}} · driver libraries: {{join facts.driverLibraries ", "}}
- Gherkin: {{facts.gherkin.features}} features, {{facts.gherkin.scenarios}} scenarios
- Locator kinds: {{#each facts.locatorKinds}}{{@key}} {{.}}{{#unless @last}}, {{/unless}}{{/each}}
