# Migration map — {{repo.alias}}

Rebuilt {{now}} from {{count}} plan cell(s). One cell per target slot in `plan/<slot>.md`; per-file mappings in `slots/`; pages in `PAGES.md`; tests in `TESTS.md`; stack facts in `facts.md`.

Read the slot table first. A **gap** row means the core must gain something before that slot can be migrated; collect the gap rows of every repository before changing the core.

## Slots

| Slot | Files | Gap | Approach |
|---|---|---|---|
{{#each records}}
| [{{subject}}](plan/{{slug subject}}.md) | {{result.count}} | {{result.gap}} | {{truncate result.approach 180}} |
{{/each}}
{{#if taxonomyUnused}}

## Slots no infrastructure file maps onto ({{count taxonomyUnused}} of {{count taxonomyIds}})

{{join taxonomyUnused ", "}}

Not a finding by itself: TW.PAGE and TW.TEST are inventoried in `PAGES.md` and `TESTS.md`, and a slot can be absent because the repository never needed it.
{{/if}}

## Stack (script)

- Target frameworks: {{#each facts.targetFrameworks}}{{@key}}{{#unless @last}}, {{/unless}}{{/each}}
- Test runners: {{join facts.testRunners ", "}} · BDD: {{join facts.bdd ", "}} · driver libraries: {{join facts.driverLibraries ", "}}
- Projects: {{facts.projectCount}} · files analysed: {{facts.files}}
- Config files: {{join facts.configFiles ", "}}
- CI: {{join facts.ciFiles ", "}}
