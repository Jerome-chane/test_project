---
name: brain-review
version: 2
answer: review
temperature: 0
system: You verify whether a knowledge note still describes a source file correctly. You answer in markdown, in exactly the requested sections.
description: Yes/no re-check of an existing note against the current file.
---
# Task

Below is a knowledge note written earlier about a file, and the file as it is now. Decide whether the note is still correct.

- Agree: yes when every fact in the note is still true of the file and nothing important is missing.
- Issues: when you do not agree, the wrong or missing points.

# Answer format

{{answerForm}}

# Note

{{previousAnswer}}

# File {{file.relpath}}{{#if codeMode}} ({{codeMode}}){{/if}}

```{{file.lang}}
{{code}}
```
