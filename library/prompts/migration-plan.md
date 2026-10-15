---
name: migration-plan
version: 1
answer: migration-plan
temperature: 0
system: You write one slot of a migration plan from per-file mappings made earlier. You answer in markdown, in exactly the requested sections.
description: One plan cell per target slot and repository: approach, ordered work, risks, gap.
---
# Task

{{vars.purpose}}

Slot **{{group.key}}** in repository **{{repo.alias}}**. Below are the per-file records that map onto it (written earlier from the files themselves). Write the plan cell for this slot. Only use what the records say; do not add knowledge about the libraries in general.

# Target core

{{vars.target}}

# Slots and fixed values

{{taxonomyText}}

# Rules

- Work: ordered items a developer can start with, each naming the files or types involved. Reuse before adapt, adapt before rewrite.
- Gap: yes only when a record says the target has no place for something the repository needs (disposition gap), or when every record would have to be dropped to fit.

# Answer format

{{answerForm}}

# Records ({{group.count}} file(s))

{{#each group.records}}
## {{file}}

{{result.summary}}

{{#each result.slots}}
- {{id}} ({{disposition}}, {{effort}}, {{join platforms ", "}}): {{what}}{{#if keep}} — keep: {{join keep "; "}}{{/if}}{{#if change}} — change: {{join change "; "}}{{/if}}{{#if depends}} — depends on: {{join depends ", "}}{{/if}}
{{/each}}

{{/each}}
