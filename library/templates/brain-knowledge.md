---
Title: {{file.title}}
Source: {{file.relpath}}
Commit: {{file.commit}}
Hash: {{file.hash}}
Learned: {{today}}
LastUsed: -
Verified: -
Passes: 1
Summary: {{result.summary}}
Tags: {{join result.tags ", "}}
Model: {{model}}
---
# {{file.title}}

{{result.summary}}

## Facts

{{#each result.facts}}
- {{.}}
{{/each}}
{{#if result.concerns}}

## Concerns

{{#each result.concerns}}
- {{.}}
{{/each}}
{{/if}}
{{#if result.related}}

## Related

{{join result.related ", "}}
{{/if}}
