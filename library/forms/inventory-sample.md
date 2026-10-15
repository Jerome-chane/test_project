---
name: inventory-sample
version: 1
description: How one sampled page object or test file is written, in fixed choices.
---

# Answer form: inventory-sample

One `## Sample` section of `- field: value` lines. The fixed choices come from the taxonomy (patterns, platform branching, data access, platforms), so they can be counted across repositories.

## Sample

- kind: fields

| Field | Kind | Values | Count | Length | Hint |
|---|---|---|---|---|---|
| kind | one | page-object, step-definitions, test, fixture, other | | | |
| platforms | names | taxonomy:platforms | 1-5 | | |
| pattern | one | taxonomy:patterns | | | for page objects; other for tests |
| platformBranching | one | taxonomy:platformBranching | | | |
| dataAccess | one | taxonomy:dataAccess | | | |
| waitsInside | bool | | | | yes when the file itself waits for elements or states |
| assertionsInside | bool | | | | yes when it asserts (expected for tests) |
| frameworkCalls | names | | 0-10 | 1-80 | framework methods this file calls, as written in the file |
| observations | lines | | 0-3 | 1-200 | what stands out: duplication, hard sleeps, deep inheritance, good structure |
