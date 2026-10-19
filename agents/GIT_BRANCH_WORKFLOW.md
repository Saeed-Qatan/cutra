# Git Branch Workflow

Use the current owner-requested branch `AUTH` for the current work. Inspect Git status before edits and preserve existing work. Do not create branches, commits, pushes, or pull requests without the owner's request.

Develop one page at a time. Before a handoff, verify the active UI, run `flutter analyze --no-pub` and relevant tests, and update `TASKS.md`/`SYNC_MATRIX.md`. After the owner starts another feature, use the branch strategy they request. Backend integration remains a later stage.
