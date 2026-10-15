---
name: brain-note
version: 1
description: One knowledge note per file, brain-kit style: summary, facts, tags, related names, concerns.
---

# Answer form: brain-note

What the model writes for each file of the `brain` definition. The engine turns this form into the answer instructions of the prompt (`{{answerForm}}`), checks the answer against it (problems are sent back on retry), and stores the answer in this shape.

Section kinds: `text`, `lines` (one sentence per bullet), `names` (comma-separated), `one` (a single allowed value), `bool` (yes/no), `number`, `fields` (`- field: value` lines, described by a table), `repeat` (`## Heading: key`, repeated). Ranges: `count: 1-5`, `length: 10-200`. Values: literals, `taxonomy:<list>`, `OTHER:*`.

## Summary

- kind: text
- length: 10-200
- hint: one sentence starting with what the file is

## Facts

- kind: lines
- count: 3-20
- length: 10-240
- hint: one fact per line, true of the file as it is now; name the class, method, key or attribute

## Tags

- kind: names
- count: 1-6
- length: 1-24
- hint: short lower-case tags such as driver, config, page-object, hooks, test, model, util

## Related

- kind: names
- count: 0-20
- length: 1-120
- hint: names of types, members or namespaces this file depends on or that depend on it

## Concerns

- kind: lines
- count: 0-3
- length: 1-200
- hint: what a maintainer should know: empty catch, static mutable state, hard-coded waits, duplicated logic
