---
name: inventory-review
version: 2
answer: review
temperature: 0
system: You verify whether a capability classification still matches a source file. You answer in markdown, in exactly the requested sections.
description: Yes/no re-check of a capability record against the current file.
---
# Task

Earlier, this file was classified as below. Looking at the file as it is now, is the classification right?

- Agree: yes when every listed capability is really implemented, extended, configured or used here with the cited evidence, and no major capability is missing.
- Issues: the wrong or missing points.

# Vocabulary

{{taxonomyText}}

# Answer format

{{answerForm}}

# Earlier classification

{{previousAnswer}}

# File {{file.relpath}}{{#if codeMode}} ({{codeMode}}){{/if}}

```{{file.lang}}
{{code}}
```
