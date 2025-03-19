# The Task
Create a multi-platform Cocktail recipe app which allows users to manage recipes and keeps those recipes stored in the cloud and synced across all devices. The UI should be easy, engaging, and delightful to use, as well as follow good Accessibility practices to be fully usable by screen reader, those with low vision, and color blindness.

## Requirements
- Work on Android, iOS, Mac OS, and Linux
- Be Accessible to screen readers
- Be offline-1st app while supporting device syncing
- Use Material 3 UI/UX
- Allow light and dark mode
- Allow users to take pictures to add to recipes
- Allow rich text input for about, instructions, & notes
- Provide user account management
- Support portrait & landscape orientation

## Features
- Login
- Account Page
    - change password
    - delete account
    - log out
    - show user info
- List recipe View
    - Add a recipe
    - Delete a recipe
    - Edit a recipe
    - View a recipe
    - sort recipes (save sort state in shared prefs)
    - filter recipes (save filter state in shared prefs)
    - Switch between list or grid
    - Search recipes (Full text search)
- Detail recipe View
    - Delete the recipe
    - Share a recipe (plain text)
    - Edit a recipe
- Create/Edit recipe view
    - Take a picture for the recipe image
    - markdown or rich text editor for appropriate fields
- Sync recipes with backend