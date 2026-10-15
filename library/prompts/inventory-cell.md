---
name: inventory-cell
version: 2
answer: inventory-cell
temperature: 0
system: You summarise how one framework handles one capability, from per-file classifications made earlier. You answer in markdown, in exactly the requested sections.
description: One capability cell per repo — approach, strengths, weaknesses — from the capability records of that repo.
---
# Task

{{vars.purpose}}

Capability **{{group.key}}** in repository **{{repo.alias}}**. Below are the per-file records that mention it (written earlier from the files themselves). Write the cell for the comparison matrix. Only use what the records say; do not add knowledge about the libraries in general.

# Vocabulary

{{taxonomyText}}

# Answer format

{{answerForm}}

# Records ({{group.count}} file(s))

{{#each group.records}}
## {{file}}

{{result.summary}}

{{#each result.capabilities}}
- {{id}} ({{role}}, {{join platforms ", "}}): {{mechanism}} — evidence: {{join evidence ", "}}{{#if concerns}}; concerns: {{join concerns "; "}}{{/if}}{{#if notable}}; notable: {{join notable "; "}}{{/if}}
{{/each}}

{{/each}}
