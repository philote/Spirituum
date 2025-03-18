import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spirituum/presentation/screens/recipe_list_screen.dart';
import 'package:spirituum/presentation/screens/recipe_detail_screen.dart';
import 'package:spirituum/presentation/screens/recipe_edit_screen.dart';
import 'package:spirituum/presentation/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';

/// The main application widget for Spirituum Cocktail App
///
/// This class sets up the MaterialApp with appropriate theme settings,
/// routing configurations, and other app-wide settings.
class SpiritumApp extends ConsumerWidget {
  /// Creates a new SpiritumApp instance
  const SpiritumApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Setup the theme mode (could be controlled by a provider in the future)
    final themeMode = ThemeMode.system; // Default to system setting

    // Create router configuration
    final router = _createRouter();

    return MaterialApp.router(
      title: 'Spirituum',
      debugShowCheckedModeBanner: false,
      
      // Apply Material 3 themes for light and dark mode
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      
      // Accessibility configuration
      supportedLocales: const [Locale('en', 'US')],
      
      // Add required localization delegates for Flutter Quill
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterQuillLocalizations.delegate,
      ],
      
      // Enable scrollbar behaviors for better accessibility
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        scrollbars: true,
      ),

      // Router configuration
      routerConfig: router,
    );
  }
  
  /// Creates the app router configuration
  GoRouter _createRouter() {
    return GoRouter(
      initialLocation: '/',
      routes: [
        // Recipe list screen (home)
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const RecipeListScreen(),
          routes: [
            // Recipe detail screen
            GoRoute(
              path: 'recipe/:id',
              name: 'recipe-details',
              builder: (context, state) => RecipeDetailScreen(
                recipeId: state.pathParameters['id']!,
              ),
              routes: [
                // Edit recipe screen
                GoRoute(
                  path: 'edit',
                  name: 'edit-recipe',
                  builder: (context, state) => RecipeEditScreen(
                    recipeId: state.pathParameters['id']!,
                  ),
                ),
              ],
            ),
            // Create new recipe screen
            GoRoute(
              path: 'create',
              name: 'create-recipe',
              builder: (context, state) => const RecipeEditScreen(),
            ),
          ],
        ),
      ],
      // Custom error page for invalid routes
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Page Not Found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'The requested page could not be found.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.home),
                label: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}