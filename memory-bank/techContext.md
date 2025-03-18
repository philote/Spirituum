- Technologies used
- Development setup
- Technical constraints
- Dependencies

## Technologies & Libraries
- Language: Dart & Flutter
- State management: Riverpod (https://riverpod.dev/docs/introduction/getting_started)
- Backend: Supabase (https://supabase.com/docs/reference/dart/introduction)
- Database: Drift (https://drift.simonbinder.eu/setup/)
- Data Sync: PowerSync (https://pub.dev/documentation/powersync/latest/)
- Persistent storage for simple data and user preferences: Shared Preferences
- Http client: Dio (https://pub.dev/documentation/dio/latest/)
- User Auth: Supabase (https://supabase.com/docs/reference/dart/introduction)
- Rich Text, Markdown & HTML Editor: flutter_quill (https://github.com/singerdmx/flutter-quill/blob/master/doc/code_introduction.md)
  - **Important**: Flutter Quill requires proper localization setup. The `FlutterQuillLocalizations.delegate` must be included in the app's localization delegates.
- UI design: Material 3

## Doc Comments
- Document code elements such as classes, methods, functions, and variables in a way that will be recognized by the Dart documentation tool (`dartdoc`)
- Prefer using `///` for public APIs and important private members
- Include concise summaries and avoid redundancy with surrounding context
- Use examples and explanations for parameters, return values, and exceptions where helpful

## Testing
- create Unit tests for business logic classes
    - Tests should not share state.
