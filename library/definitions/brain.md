---
name: brain
version: 1
extractors: text, csharp, git
taxonomy:
allowWriteInsideTarget: yes
---

# brain

Knowledge note per source file (summary + facts) in brain-kit's header format, an INDEX.md per repo, a 10% nightly re-check and archiving of notes whose source disappeared.

Writes into the target repository (`brain/` folder), hence `allowWriteInsideTarget: yes`. Add `brain/` to the repository's `.gitignore` unless the notes should be tracked.

The `goal` variable is shown at the top of INDEX.md and inside every learn prompt. Whatever reads the brain steers by this sentence, so keep it about the project, not about the brain.

## Routes

- out: `{{target}}/brain`

## Variables

- goal: Understand this repository well enough to extend it safely: structure, responsibilities, conventions, known pitfalls.

## Select

- maxChars: 300000
- skipGenerated: yes
- skipVendored: yes
- skipBinary: yes

### Include

- `**/*.cs`
- `**/*.vb`
- `**/*.fs`
- `**/*.dart`
- `**/*.ts`
- `**/*.tsx`
- `**/*.js`
- `**/*.py`
- `**/*.java`
- `**/*.kt`
- `**/*.go`
- `**/*.rs`
- `**/*.swift`
- `**/*.feature`
- `**/*.csproj`
- `**/*.props`
- `**/*.md`
- `**/*.yml`
- `**/*.yaml`
- `**/appsettings*.json`
- `**/*.runsettings`
- `**/App.config`
- `**/*.ps1`
- `**/*.sh`

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
- `brain/**`
- `**/*.lock`
- `**/package-lock.json`
- `**/*.min.*`
- `**/CHANGELOG*`
- `**/LICENSE*`

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

- maxPromptChars: 40000
- fullFileMaxChars: 14000
- charsPerToken: 4.9

## Step: learn

One note per source file; re-learned when the file's hash or the prompt version changes.

- kind: perFile
- prompt: brain-learn
- key: hash, promptVersion
- retries: 1

### Filter: all

- binary missing
- chars >= 60

### Inputs

- code: yes
- facts: relpath, lang, layer, types, bases, members, imports, hooks, testMarkers, platformHints, subclasses, callers, commits, lastChange, codeMode
- neighbors: yes
- taxonomy: no
- previous: yes

### Grounding

- fields: related
- against: types, members, imports, bases, subclasses, callers
- onMiss: drop

### Writers

- brain-knowledge → `{{routes.out}}/knowledge/files/{{file.relpath}}.md`

## Step: index

INDEX.md and one index per top-level folder, rebuilt from the records (never by the model).

- kind: index
- from: learn
- groupBy: `facts.folder`

### Writers

- brain-index → `{{routes.out}}/INDEX.md`
- brain-goal → `{{routes.out}}/GOAL.md`

## Step: review

Re-check a sample of notes against the current source; disagreements are flagged, not rewritten.

- kind: review
- prompt: brain-review
- from: learn
- key: hash, promptVersion, taxonomyVersion
- sampleRate: 0.1
- minDays: 7
- retries: 1

### Inputs

- code: yes
- facts: relpath, lang, types, members
- neighbors: no
- taxonomy: no

## Step: archive

Notes whose source file no longer exists move to brain/_archive/<date>/.

- kind: archive
- from: learn
