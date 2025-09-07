## Architecture

Layered architecture which consists of:

* API/data provider layer
* Repository layer
* Bloc layer
* Presentation layer

A general rule is that the layers should avoid having sibling dependencies. That is, a Bloc should avoid having direct knowledge of any other Bloc.

Layers can depend on more than one package in the layer above. For example, a Bloc can be injected with multiple repositories.

Inspired by [Bloc](https://bloclibrary.dev/architecture/)/[Very good](https://verygood.ventures/blog/very-good-flutter-architecture) layered architecture.

![architecture diagram](https://bloclibrary.dev/_astro/architecture.DXhmDgKF_Z1jU9hW.webp)

### Folder structure

Presentation and Bloc layer
* Feature folders

Repository, API layer and other modules
* Packages

### app_ui package
Flutter mapping to Figma components and other UI-related details.

### Presentation layer
Contains the structure of a feature.
Adds user events to the Bloc and renders itself based on the states emitted by the Bloc.

### Bloc layer 
Emits states in response to user events based on simple branching.
Contains models with feature-related logic and transformations.

### Repository layer
Transforms data from the API layer into domain-specific models that may be used by one or many Blocs.

### API layer
Dart mapping to an internal or external data source, with minimal transformations.