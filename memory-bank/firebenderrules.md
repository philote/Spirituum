# Firebender Rules for Spirituum Project

## UI Patterns

### Theme Configuration
- Use `withAlpha()` instead of `withOpacity()` for color transparency
- Set explicit iconTheme in both the global theme and component-specific themes (like appBarTheme)
- For dark theme:
  - Use `Colors.white.withAlpha(222)` (87% opacity) for high-emphasis elements
  - Ensure all interactive elements have sufficient contrast
- For light theme:
  - Use `Colors.black87` or `Colors.black.withAlpha(222)` for high-emphasis elements

### Icon Styling and UI Consistency
- Use `Theme.of(context).colorScheme.primary` for colored icons like favorites
- Maintain visual consistency between different views of the same functionality
- For toggleable icons (like favorites), ensure they use the same visual cues across the app

### Flutter Quill Integration
- Always include required localization delegates when using Flutter Quill
- Ensure `flutter_localizations` is added to pubspec.yaml dependencies

### Form Fields and State Management
- Add text controller listeners for fields that need to be preserved when other fields change
- Use `updateRecipe` or similar methods for direct state updates without saving to database
- Check if TextFormField needs special configuration (like maxLength or keyboardType) based on intended use
- Always invalidate related providers when saving data to ensure lists are refreshed

## State Management Patterns
- Reuse controller logic for similar operations across different views
- When toggling state that affects multiple views, invalidate all relevant providers
- For simple UI states that don't affect the data model, use local state management
- For data changes that should persist, always go through the appropriate controller

## Dependency Management
- When adding UI packages, check their documentation for any required configuration
- Pay special attention to localization requirements for interactive widgets

## Accessibility Practices
- Ensure sufficient contrast for icons, text, and interactive elements
- Configure themes to properly handle both light and dark modes
- Test UI components in both theme modes before considering them complete