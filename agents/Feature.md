# Feature Workflow

A feature is complete only when its supplied design, interactions, validation, loading/error states, navigation, ViewModel, necessary services, and tests work together. A static screen is incomplete.

Use `TASKS.md` to track the current feature. At present only Splash and Login are active. Future pages have no active routes. Wait for the owner's page design before creating their code.

For each feature: identify the design and behavior, implement View -> ViewModel -> Service as needed, verify target sizes and lifecycle, run analysis/tests, and update the task and sync matrix. Models contain data only. The final backend connection is a later task; do not claim preliminary API calls are production integration.

Handoff: feature, design source, behavior/states, files, verification, deferred contract, open questions, and next page.
