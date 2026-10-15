---
name: review
version: 1
description: Yes/no re-check of an earlier answer against the file as it is now.
---

# Answer form: review

Used by review steps. `Agree: no` flags the record for a human; nothing is rewritten.

## Agree

- kind: bool
- hint: yes when every point of the earlier answer is still true and nothing important is missing

## Issues

- kind: lines
- count: 0-5
- length: 1-200
- hint: the wrong or missing points, one per line; none when you agree

## Note

- kind: text
- length: 0-200
- required: no
- hint: one sentence for a human
