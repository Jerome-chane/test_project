# Capability matrix — {{repo.alias}}

Rebuilt {{now}} from {{count}} capability cell(s). Cells are in `cells/<capability>.md`; per-file records in `capabilities/`.

| Capability | Completeness | Files | Approach |
|---|---|---|---|
{{#each records}}
| [{{subject}}](cells/{{slug subject}}.md) | {{result.completeness}} | {{result.count}} | {{truncate result.approach 180}} |
{{/each}}
{{#if taxonomyUnused}}

## Not claimed by any infrastructure file ({{count taxonomyUnused}} of {{count taxonomyIds}})

{{join taxonomyUnused ", "}}

A missing id is a finding to check, not proof of absence: the capability may live in a file the candidates filter did not select (low infra score, test or page-object layer).
{{/if}}
