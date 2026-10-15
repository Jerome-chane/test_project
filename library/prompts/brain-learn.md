---
name: brain-learn
version: 2
answer: brain-note
temperature: 0
system: You read one source file and distil what a developer needs to know about it. You answer in markdown, in exactly the requested sections.
description: One knowledge note per file (summary + up to 20 facts), brain-kit style.
---
# Task

Produce a knowledge note for ONE file of a software repository. The note will be read later by developers and by other tools that work on this repository, so every fact must be true of the file as it is now and specific enough to act on.

Project goal (steers what matters): {{vars.goal}}

# Rules

- Only state what the file shows. Do not guess behaviour of code you cannot see.
- Facts are complete sentences, each about one thing: responsibility, public API, dependencies, conventions, side effects, configuration it reads, errors it swallows, tests it defines, things that look fragile.
- Prefer names over descriptions: say which class, method, key or attribute.
- Fewer good facts beat padding.
- Related: names only, taken from the file or the context below.
{{#if previous}}
- A previous note exists (below). The file changed. Keep facts that are still true, drop the ones that are not, add what is new.
{{/if}}

# Answer format

{{answerForm}}

# Context (extracted from the repository, not from the model)

- Path: {{file.relpath}}  ({{file.lang}}, layer {{facts.layer}}, {{facts.lines}} lines)
- Types declared: {{join facts.types ", "}}
- Base types / interfaces: {{join facts.bases ", "}}
- Members: {{join facts.members ", "}}
- Imports: {{join facts.imports ", "}}
{{#if facts.hooks}}
- Hooks: {{join facts.hooks ", "}}
{{/if}}
{{#if facts.testMarkers}}
- Test markers: {{join facts.testMarkers ", "}}
{{/if}}
{{#if facts.platformHints}}
- Platform hints: {{join facts.platformHints ", "}}
{{/if}}
{{#if neighbors.subclasses}}
- Files that inherit from its types: {{join neighbors.subclasses ", "}}
{{/if}}
{{#if neighbors.callers}}
- Files that use its types: {{join neighbors.callers ", "}}
{{/if}}
{{#if facts.commits}}
- Git: {{facts.commits}} commits, last change {{facts.lastChange}}
{{/if}}
{{#if previous}}

# Previous note

{{previous}}
{{/if}}

# File{{#if codeMode}} ({{codeMode}}){{/if}}

```{{file.lang}}
{{code}}
```
