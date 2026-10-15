---
name: e2e-inventory
version: 1
extractors: text, csharp, git, projects
taxonomy: e2e-v0
allowWriteInsideTarget: no
---

# e2e-inventory

Capability inventory of an e2e automation framework: repo stack facts, one record per infrastructure file, sampled page objects and tests, one cell per capability, a matrix and an export draft without names or paths.

What each end-to-end automation framework does, in a fixed vocabulary (taxonomy e2e-v0), so several frameworks can be compared capability by capability before designing one shared core. Facts (packages, types, calls, locators, markers) come from the extractors; the model only classifies infrastructure files, describes samples and summarises each capability. Outputs are markdown under `{{data}}/analysis/<alias>/`, outside any repository.

## Routes

- out: `{{data}}/analysis/{{repo.alias}}`

## Variables

- purpose: This repository is one of several sources for a new shared test-automation core. Describe what it does and how; do not propose refactors of this repository.

## Select

- maxChars: 300000
- skipGenerated: yes
- skipVendored: yes
- skipBinary: yes

### Include

- `**/*.cs`
- `**/*.ts`
- `**/*.tsx`
- `**/*.js`
- `**/*.java`
- `**/*.kt`
- `**/*.py`
- `**/*.feature`
- `**/*.csproj`
- `**/*.props`
- `**/Directory.*.props`
- `**/appsettings*.json`
- `**/*.runsettings`
- `**/App.config`
- `**/Web.config`
- `**/*.yml`
- `**/*.yaml`
- `**/*.json`
- `**/package.json`
- `**/pom.xml`
- `**/build.gradle`
- `**/requirements.txt`
- `**/README*`
- `**/Jenkinsfile`

### Exclude

- `**/bin/**`
- `**/obj/**`
- `**/node_modules/**`
- `**/.git/**`
- `**/.vs/**`
- `**/.idea/**`
- `**/packages/**`
- `**/TestResults/**`
- `**/dist/**`
- `**/build/**`
- `**/*.lock`
- `**/package-lock.json`
- `**/*.min.*`
- `**/launchSettings.json`
- `**/*.Designer.cs`
- `**/*.feature.cs`

### Generated

- `**/*.feature.cs`
- `**/*.Designer.cs`
- `**/*.g.cs`
- `**/*.g.i.cs`
- `**/*.generated.*`
- `**/*.min.js`
- `**/*.min.css`
- `**/*.freezed.dart`
- `**/*.g.dart`

## Budget

- maxPromptChars: 44000
- fullFileMaxChars: 12000
- charsPerToken: 4.9

## Step: facts

Deterministic stack sheet: frameworks, packages, runners, BDD, locator kinds, hot files, config keys. No model.

- kind: index

### Writers

- inventory-facts → `{{routes.out}}/facts.md`

## Step: capabilities

Infrastructure files only (inheritance, callers, hooks, driver creation): which capabilities each implements, with evidence.

- kind: perFile
- prompt: inventory-capabilities
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Filter: all

- binary missing
- lang in csharp, typescript, javascript, java, kotlin, python
- layer in core, other

### Filter: any

- infraScore >= 3
- hooks >= 1
- markers.driverCreation >= 1
- subclassCount >= 3
- callerFiles >= 5

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, imports, hooks, attributes, platformHints, subclasses, callers, locators, markers, infraScore, codeMode
- neighbors: yes
- taxonomy: yes

### Grounding

- fields: capabilities[].evidence
- against: members, types
- onMiss: reject

### Writers

- inventory-capability → `{{routes.out}}/capabilities/{{file.relpath}}.md`

## Step: samples

A few page objects and tests per platform: how they are written today.

- kind: perFile
- prompt: inventory-sample
- key: hash, promptVersion, taxonomyVersion
- sample: 3 per platformHints
- retries: 1

### Filter: all

- binary missing
- layer in page-object, test
- chars >= 300

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, locators, markers, platformHints, codeMode
- neighbors: yes
- taxonomy: yes

### Grounding

- fields: frameworkCalls
- against: calls, members, bases
- onMiss: drop

### Writers

- inventory-sample → `{{routes.out}}/samples/{{file.relpath}}.md`

## Step: cells

One cell per capability: the files that implement it (script) plus a short description of the approach (model).

- kind: aggregate
- prompt: inventory-cell
- from: capabilities
- groupBy: `result.capabilities[].id`
- key: hash, promptVersion, taxonomyVersion
- retries: 1

### Inputs

- code: no
- neighbors: no
- taxonomy: yes

### Writers

- inventory-cell → `{{routes.out}}/cells/{{slug group.key}}.md`

## Step: matrix

Capability × files matrix for this repo, plus the export draft (aliases, ids and counts only).

- kind: index
- from: cells

### Writers

- inventory-matrix → `{{routes.out}}/matrix.md`
- inventory-export → `{{routes.out}}/export-draft.md`

## Step: review

Re-check 10% of capability records against the source.

- kind: review
- prompt: inventory-review
- from: capabilities
- key: hash, promptVersion, taxonomyVersion
- sampleRate: 0.1
- minDays: 7
- retries: 1

### Inputs

- code: yes
- facts: relpath, lang, types, members
- neighbors: no
- taxonomy: yes
