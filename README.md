# AI_Analyst — build folder

This folder is the compiled app: a framework-dependent .NET 10 build. It needs the .NET 10 runtime, including ASP.NET Core, and nothing else. The source is not here.

## Update

```
git pull
```

Stop the app first (Settings → Quit). A running exe locks its DLLs.

## Start

Double-click `run.cmd`, or:

```
AI_Analyst.exe --open
```

The UI runs at <http://127.0.0.1:47311> (loopback only). A second launch prints that address and exits.

| Option | Effect |
|---|---|
| `--data <folder>` | Data folder. Default: `..\AI_Analyst_data`, next to this folder, outside the git repo |
| `--port <n>` | UI port for this launch (permanent: Settings) |
| `--open` | Open the UI in the browser |
| `--hidden` | No console window (used by the Startup entry and the daily task) |
| `--no-schedule` | Manual runs only |
| `--selfcheck` | End-to-end check without a model; does not touch your data folder |

## Your data stays outside this folder

The data folder holds settings, repo paths, jobs, run state, logs and your edited definitions, prompts, answer forms, templates and taxonomies: `..\AI_Analyst_data` by default. All of it is markdown (`settings.md`, `repos.md`, `jobs\*.md`, `state\<job>\records.md`, `calls.md`), so you can read it in any editor. Nothing in it is ever committed here. Your library edits are saved there as user copies, and they take precedence over the files in `library\`. A `git pull` updates the shipped versions but never overwrites your copies.

To use another data folder permanently, put its path in a `data-folder.txt` next to `AI_Analyst.exe`. That file is git-ignored.

## Upgrading from 0.1

On the first start of 0.2, the old `.json` settings, repos, jobs and library copies in the data folder are converted to `.md`, and the old files are renamed `*.migrated` (nothing is deleted). The log lists each conversion. Old records and call logs are not converted, because their answers were JSON, so those units run again.

## First night

1. **Settings**: check the Ollama URL and the default model (`qwen-coder`). If brain-kit's daemon still runs, add its `PAUSE` file under hold files, so the two never use Ollama at the same time.
2. **Repos**: add each target folder with a neutral alias.
3. **Jobs → New job**: pick a definition and the repos, then set the windows (`daily 23:00-06:00 nightly`, `fri 20:00 +58h weekend`).
4. **Dry run**, then open the outputs under `AI_Analyst_data\dryrun\…`.
5. **Run now** with *Max model calls per run* = 3. Check the run page: real token counts, valid answers, sensible files. If answers fail their checks, the run page shows them as the model wrote them, with the problems that were sent back.
6. **Settings → Start automatically**: Startup folder or daily task. The schedule only opens windows while the app runs.

## Clean up

A run never deletes anything. To remove what a job wrote, open the job and click **Clean up**: the page lists its records and call log, its run history, its dry-run outputs, each output folder (with the archive of outputs whose source file disappeared) and the job file itself, each with its path and size. Tick what to delete, type `delete`, and only that goes. Deleting the records makes every unit run again next time. **Jobs → Leftovers** lists what no job claims any more: retired job files, state and outputs of jobs that were retired or removed, and `*.migrated` files of the 0.1 conversion. Nothing can be deleted while a run is active, and nothing outside the data folder is deleted, except an output folder inside a target repository when the definition declares it (the `brain/` folder).

## Stop, pause and the schedule

Everything is controlled from the UI. **Stop job** and **Stop all** are in the top bar of every page while a run is active. Both end the run now: the model call in flight is cancelled and finished units are kept.

- **Stop job** ends this run only. If it was a scheduled run, its window is skipped, so the job does not start again tonight. The schedule goes on: another job whose window is open starts at the next scheduler tick.
- **Stop all** ends this run and stops the schedule, so no other job starts by itself, even one whose window is open. The top bar shows *schedule stopped* until you click **Resume schedule** on the dashboard.
- **Pause** holds the run at the next model call. **Continue** picks it up there. If the app closes while a run is paused, the schedule is stopped after the restart.
- **Resume run** (dashboard, Jobs, run pages) starts a stopped or failed run again with the same options, inside its window if that window is still open. Finished units are reused, so it continues where it stopped.
- **Stop schedule** / **Resume schedule** (dashboard and Jobs page): while the schedule is stopped, no scheduled window starts, and a run already active keeps going (use Stop all to end it too). **Run now** still works.
- Per job, in the Dashboard and Jobs lists: **Schedule off/on** (the windows are kept), **Skip this window** or **Skip next window** (with **Undo skip**), and **Disable/Enable** (a disabled job never starts).
- These switches are saved in `AI_Analyst_data\control.md`, so a restart does not undo them. Use the buttons rather than editing the file. The `PAUSE` file of earlier versions is no longer read: if one is found at start-up, the schedule is stopped and the file is renamed `PAUSE.migrated`.
- **Settings → Quit** closes the app. The active run ends; the schedule is not stopped and no window is skipped, so after a restart the run picks up again in its window.
