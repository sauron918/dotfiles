## Coding Principles
These principles apply across all repositories.

### General Principles
* Prefer simple, explicit, and maintainable solutions.
* Keep business logic separate from framework-specific code when possible.
* Use clear names for classes, functions, variables, and files.
* Avoid unnecessary abstraction.
* Keep methods and components small.
* Make validation rules explicit.
* Fail early when content or input data is invalid.
* Write code that is easy to test.
* Prefer readability over cleverness.
* Avoid introducing multiple names for the same concept.

### Backend Principles
* Keep Symfony controllers thin.
* Move business logic into services.
* Keep parsing logic isolated from persistence logic.
* Validate parsed content before storing it.
* Use DTOs or dedicated response models when they improve API clarity.
* Avoid exposing Doctrine entities directly through API responses.
* Keep database migrations clear and reviewable.
* Use meaningful exceptions and validation messages.

### Frontend Principles
* Keep React components focused and small.
* Separate API access from UI components.
* Avoid duplicating backend business rules in the frontend.
* Use shared TypeScript types where practical.
* Keep state management simple.
* Prefer explicit loading, error, and empty states.
