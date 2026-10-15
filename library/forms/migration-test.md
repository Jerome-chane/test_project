---
name: migration-test
version: 1
description: What one test file tests (scenarios, pages, data, preconditions) and how it is wired (runner, base classes, hooks, sessions).
---

# Answer form: migration-test

One `## Test` section of `- field: value` lines. The scenarios are the tests to write again on the target core; the rest says what the test base must provide.

## Test

- kind: fields

| Field | Kind | Values | Count | Length | Required | Hint |
|---|---|---|---|---|---|---|
| runner | one | taxonomy:runners | | | yes | |
| bases | names | | 0-3 | 1-80 | no | base classes this file inherits, as named in the file |
| hooksUsed | names | | 0-8 | 1-60 | no | lifecycle attributes used in this file |
| dataSource | one | taxonomy:dataSources | | | yes | where the test's inputs come from |
| sessions | one | taxonomy:sessions | | | yes | how many driver sessions one test uses |
| platforms | names | taxonomy:platforms | 1-4 | | yes | |
| scopeHint | text | | | 3-120 | yes | which driver or environment configuration this file needs, in words |
| pagesUsed | names | | 0-15 | 1-80 | no | page or screen types this file uses |
| scenarios | lines | | 1-40 | 5-200 | yes | one per test method: its name, then what it checks, as `Name: what it checks` |
| preconditions | lines | | 0-6 | 1-160 | no | state the tests assume before they start: a logged-in user, seeded data, an installed app, a device setting |
| needs | lines | | 1-6 | 1-200 | yes | what the test relies on the base class or hooks to do, one per line |
| notes | lines | | 0-3 | 1-200 | no | retries, categories, parallel attributes, anything unusual |
