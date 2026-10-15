---
name: migration-page
version: 1
description: Inventory of one page or screen object for building page interfaces and page sets.
---

# Answer form: migration-page

One `## Page` section of `- field: value` lines. The answer feeds the page list per application and the draft page interface, so names must come from the file.

## Page

- kind: fields

| Field | Kind | Values | Count | Length | Required | Hint |
|---|---|---|---|---|---|---|
| application | text | | | 1-40 | yes | the application or area this page belongs to, from the namespace or folder, as one PascalCase word usable in an identifier |
| platforms | names | taxonomy:platforms | 1-4 | | yes | |
| pageName | text | | | 1-40 | yes | the page's short name, used as the page set property, such as Login |
| interfaceName | text | | | 3-60 | yes | the page interface to create, such as ILoginPage |
| actions | names | | 1-25 | 1-80 | yes | public members a test calls on this page, as named in the file |
| driverAccess | one | taxonomy:driverAccess | | | yes | how the page reaches the driver: directly, through a base class, through a wrapper |
| locatorsInline | bool | | | | yes | yes when locators are declared in this file |
| waitsInside | bool | | | | yes | yes when the file itself waits for elements or states |
| navigatesTo | names | | 0-8 | 1-60 | no | other page types this page returns or creates |
| notes | lines | | 0-3 | 1-200 | no | what a migrator should know: duplication, platform branches, hard sleeps, business logic inside the page |
