---
name: migration-feature
version: 1
description: The scenarios, background, tags and screens of one Gherkin feature file, to write them again as test methods.
---

# Answer form: migration-feature

One `## Feature` section of `- field: value` lines. The scenarios are the tests to write again; the background is what each of them must establish first.

## Feature

- kind: fields

| Field | Kind | Values | Count | Length | Required | Hint |
|---|---|---|---|---|---|---|
| application | text | | | 1-40 | yes | the application or area, as one PascalCase word usable in an identifier |
| platforms | names | taxonomy:platforms | 1-4 | | yes | |
| tags | names | | 0-10 | 1-40 | no | the tags used in the file, without the @ |
| scenarios | lines | | 1-40 | 5-200 | yes | one per scenario: its name, then what it checks, as `Name: what it checks` |
| background | lines | | 0-6 | 1-160 | no | the Background steps, one per line, as preconditions |
| pagesImplied | names | | 0-10 | 1-60 | no | screens, pages or endpoints the steps mention |
| notes | lines | | 0-3 | 1-200 | no | outlines with many rows, steps that need data from outside, anything unusual |
