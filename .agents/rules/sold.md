# SOLID Principles

Use these principles when a change makes a class or module easier to understand and test. Do not add layers or interfaces only to satisfy an acronym.

## Single Responsibility
Keep each class focused on one reason to change. A form widget renders and collects input; a Riverpod notifier owns state transitions; a service handles external I/O.

## Open/Closed
Extend behavior through small, explicit collaborators when variations are real. Avoid modifying unrelated features to add a new authentication flow.

## Liskov Substitution
An implementation must honor its interface's contract, including failures, nullability, and asynchronous behavior. Tests should exercise the contract against implementations.

## Interface Segregation
Expose only operations a consumer needs. Keep authentication and registration operations separate when they have different callers or lifecycles.

## Dependency Inversion
High-level behavior should depend on abstractions, not concrete network or storage classes. Connect implementations at the Riverpod provider boundary; keep domain code independent of Flutter and data-layer imports.

Apply these rules pragmatically alongside the project's feature-first Clean Architecture. Add an abstraction only when it removes meaningful coupling or duplication.
