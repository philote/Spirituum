# Product Context

This file provides a high-level overview of the project and the expected product that will be created.

2025-03-18 21:49:53 - Updated with comprehensive project context

## Project Goal

* Create a multi-platform Cocktail recipe application with:
  - Cloud synchronization via Supabase
  - Offline-first functionality using PowerSync
  - Rich text editing with Flutter Quill
  - Accessible and delightful user experience
  - Cross-device data synchronization

## Key Features

### Core Functionality
* Recipe Management
  - Create, read, update, delete operations
  - Rich text content support
  - Image capture and storage
  - Offline availability
  - Cross-device sync

* User Management
  - Account creation and authentication via Supabase
  - Profile management
  - Settings and preferences
  - Account deletion capability

### User Interface
* Material 3 Design System
  - Custom theming
  - Light and dark mode support
  - Responsive layouts
  - Platform-specific adaptations

* View Options
  - List and grid view toggles
  - Sort and filter capabilities
  - Full-text search
  - Recipe sharing

### Technical Features
* Offline-First Architecture
  - Local storage with Drift
  - Background synchronization
  - Conflict resolution
  - Data versioning

* Accessibility
  - Screen reader support
  - Color contrast compliance
  - Navigation aids
  - Input alternatives

## Overall Architecture

### Frontend (Flutter)
* Clean Architecture implementation
* Feature-based organization
* Riverpod state management
* Material 3 design system

### Data Layer
* Local: Drift database
* Remote: Supabase backend
* Sync: PowerSync
* Cache: Shared Preferences

### Key Technical Components
* Flutter framework
* Riverpod for state
* Supabase for backend
* Drift for local storage
* PowerSync for synchronization
* Flutter Quill for rich text
* Dio for HTTP client

### Development Approach
* Test-driven development
* Accessibility-first design
* Performance optimization
* Cross-platform testing