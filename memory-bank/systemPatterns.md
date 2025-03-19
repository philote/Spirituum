# System Patterns

This file documents recurring patterns and standards used in the project.

2025-03-18 21:47:52 - Updated with established patterns

## Coding Patterns

### Architecture Patterns
* Clean Architecture layers:
  - Domain: Pure business logic and entities
  - Data: Repositories and data sources
  - Application: Use cases and services
  - Presentation: UI and state management

### State Management Patterns
* Riverpod Implementation:
  - Controllers for data persistence
  - Local state for UI-only changes
  - Provider invalidation for list updates
  - Reuse controller logic across views

### Documentation Standards
* Doc Comments:
  - Use `///` for public APIs
  - Document important private members
  - Include concise summaries
  - Add examples where helpful
  - Use dartdoc-compatible format

## UI/UX Patterns

### Theme Implementation
* Color Handling:
  - Use `withAlpha()` instead of `withOpacity()`
  - Dark theme: `Colors.white.withAlpha(222)` for high-emphasis
  - Light theme: `Colors.black.withAlpha(222)` for high-emphasis
  - Explicit iconTheme configuration

### Component Patterns
* Icon Styling:
  - Use `Theme.of(context).colorScheme.primary` for colored icons
  - Consistent visual cues for toggleable icons
  - Maintain visual consistency across views

* Form Fields:
  - TextController listeners for state preservation
  - Appropriate keyboard types
  - MaxLength configurations where needed
  - State updates through controllers

### Rich Text Integration
* Flutter Quill Setup:
  - Include required localization delegates
  - Add flutter_localizations dependency
  - Configure custom toolbars
  - Handle state preservation

## Data Management

### Persistence Patterns
* Local Storage:
  - Drift for structured data
  - Shared Preferences for simple data
  - PowerSync for offline-first sync
  - Proper provider invalidation

### API Integration
* Network Handling:
  - Dio for HTTP client
  - Supabase for backend services
  - Error handling patterns
  - Response mapping

## Testing Patterns

### Unit Testing
* Business Logic:
  - Isolated state
  - Comprehensive coverage
  - Mock dependencies
  - Clear test descriptions

### Widget Testing
* UI Components:
  - Theme testing
  - Accessibility checks
  - Interaction testing
  - State management verification

### Integration Testing
* Feature Testing:
  - End-to-end flows
  - Cross-component interaction
  - State persistence
  - Error scenarios

## Accessibility Patterns

### Visual Design
* Contrast Requirements:
  - Sufficient contrast for all elements
  - Theme-aware implementations
  - Interactive element emphasis
  - Icon visibility

### Theme Support
* Mode Handling:
  - Light mode specifications
  - Dark mode adaptations
  - Color scheme consistency
  - Interactive element visibility

### Screen Reader Support
* Semantic Labels:
  - Meaningful descriptions
  - Action clarity
  - State announcements
  - Navigation guidance