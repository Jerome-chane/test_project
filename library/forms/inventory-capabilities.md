---
name: inventory-capabilities
version: 1
description: Which capabilities one infrastructure file implements, with evidence members, config keys, notable points and concerns.
---

# Answer form: inventory-capabilities

One `## Capability: <id>` section per capability the file implements, extends, configures or uses. Zero sections is a valid answer for a plain utility. Ids come from the taxonomy's capabilities list (`OTHER:<short-name>` when nothing fits). The `evidence` names are checked against the file's members and types.

## Summary

- kind: text
- length: 10-200
- hint: one sentence on the file's responsibility

## Capability

- kind: repeat
- field: capabilities
- key: id
- values: taxonomy:capabilities, OTHER:*
- count: 0-8
- hint: Zero sections is fine for a plain utility.

| Field | Kind | Values | Count | Length | Hint |
|---|---|---|---|---|---|
| platforms | names | taxonomy:platforms | 1-5 | | where this capability applies here; shared when platform-independent |
| role | one | taxonomy:roles | | | implements = the mechanism lives here |
| mechanism | text | | | 10-200 | how it is done, concretely: classes, libraries, patterns |
| evidence | names | | 1-5 | 1-120 | member or type names from this file that prove it |
| configKeys | names | | 0-10 | 1-80 | configuration keys it reads, names only |
| external | names | | 0-5 | 1-40 | external systems: grid, device farm, report portal, database |
| notable | lines | | 0-3 | 1-200 | good ideas worth carrying into a new framework |
| concerns | lines | | 0-3 | 1-200 | swallowed errors, hard-coded waits, static state, duplicated logic |
