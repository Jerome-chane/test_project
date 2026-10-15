---
name: migration-slot
version: 1
description: Where one infrastructure file lands in the TestWare core, what must survive, what must change.
---

# Answer form: migration-slot

One `## Slot: <id>` section per TestWare slot the file maps onto. Most files map onto one slot; a driver factory that also reads configuration maps onto two. `TW.NONE` alone when nothing should be migrated. The `evidence` names are checked against the file's members, types and config keys.

## Summary

- kind: text
- length: 10-200
- hint: one sentence on what this file does today

## Slot

- kind: repeat
- field: slots
- key: id
- values: taxonomy:slots
- count: 1-4

| Field | Kind | Values | Count | Length | Required | Hint |
|---|---|---|---|---|---|---|
| disposition | one | taxonomy:dispositions | | | yes | reuse = move as is; adapt = small edits to fit the slot; rewrite = same behaviour, new code in the slot; gap = the core has no place for it yet; drop = not needed |
| platforms | names | taxonomy:platforms | 1-4 | | yes | where it applies; shared when platform-independent |
| what | text | | | 10-240 | yes | what this file does for that slot, concretely |
| keep | lines | | 0-5 | 1-200 | no | behaviour that must survive the migration, one per line |
| change | lines | | 0-5 | 1-200 | no | what must change to fit the slot, one per line |
| evidence | names | | 1-5 | 1-120 | yes | member, type or config key names from this file that prove the mapping |
| configKeys | names | | 0-10 | 1-80 | no | configuration keys this file reads, names only |
| depends | names | | 0-6 | 1-80 | no | types from other files it needs to work |
| effort | one | taxonomy:effort | | | yes | |
