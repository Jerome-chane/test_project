---
name: migration-plan
version: 1
description: One slot of the migration plan for one repository: approach, ordered work items, risks, gaps.
---

# Answer form: migration-plan

One plan cell per TestWare slot and repository, written from the per-file slot records only.

## Approach

- kind: text
- length: 20-400
- hint: 2 to 3 sentences: what the repository has for this slot today and how it lands in the core

## Work

- kind: lines
- count: 1-8
- length: 5-200
- hint: ordered work items, one per line, each naming the files or types involved

## Risks

- kind: lines
- count: 0-4
- length: 1-200
- hint: what can break or be lost, one per line

## Gap

- kind: bool
- hint: yes when the core must gain something before this slot can be migrated

## Gap detail

- kind: text
- length: 0-300
- required: no
- hint: what the core must gain, in one or two sentences; empty when Gap is no
