---
name: inventory-cell
version: 1
description: One capability cell of the comparison matrix: approach, strengths, weaknesses, completeness.
---

# Answer form: inventory-cell

One cell per capability and repository, written from the per-file capability records only.

## Approach

- kind: text
- length: 20-400
- hint: 2 to 3 sentences on how this repository handles the capability: which files, which mechanism, which platforms

## Strengths

- kind: lines
- count: 0-3
- length: 1-200
- hint: points worth keeping in a new shared core

## Weaknesses

- kind: lines
- count: 0-3
- length: 1-200
- hint: points a new core should avoid

## Completeness

- kind: one
- values: full, partial, minimal, absent
- hint: how completely the capability is covered here, judged from the records
