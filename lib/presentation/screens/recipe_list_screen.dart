import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/presentation/controllers/recipe_list_controller.dart';
import 'package:spirituum/presentation/widgets/recipe_grid_item.dart';
import 'package:spirituum/presentation/widgets/recipe_list_item.dart';

/// Screen for displaying a list of recipes
class RecipeListScreen extends ConsumerStatefulWidget {
  /// Creates a new recipe list screen
  const RecipeListScreen({super.key});

  @override
  ConsumerState<RecipeListScreen> createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends ConsumerState<RecipeListScreen> {
  bool _isGridView = false;

  @override
  Widget build(BuildContext context) {
    final recipesAsync = ref.watch(recipeListControllerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
        actions: [
          // Toggle between list and grid view
          IconButton(
            icon: Icon(_isGridView ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _isGridView = !_isGridView),
            tooltip: _isGridView ? 'Show as list' : 'Show as grid',
          ),
          // Search button
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
            tooltip: 'Search recipes',
          ),
          // Filter button
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
            },
            tooltip: 'Filter recipes',
          ),
        ],
      ),
      body: recipesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error loading recipes: $error'),
        ),
        data: (recipes) {
          if (recipes.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_bar_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No recipes found.',
                    style: TextStyle(fontSize: 18),
                    semanticsLabel: 'No recipes found',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Add some recipes to get started!',
                    semanticsLabel: 'Add some recipes to get started',
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => _navigateToCreateRecipe(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Recipe'),
                  ),
                ],
              ),
            );
          }

          // Show either grid or list view based on user preference
          return _isGridView ? _buildGridView(recipes) : _buildListView(recipes);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToCreateRecipe(context),
        tooltip: 'Add Recipe',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(List<Recipe> recipes) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeListItem(
          recipe: recipe,
          onTap: () => _navigateToRecipeDetails(context, recipe.id),
          onFavoriteToggle: () => _toggleFavorite(recipe),
        );
      },
    );
  }

  Widget _buildGridView(List<Recipe> recipes) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeGridItem(
          recipe: recipe,
          onTap: () => _navigateToRecipeDetails(context, recipe.id),
          onFavoriteToggle: () => _toggleFavorite(recipe),
        );
      },
    );
  }

  void _navigateToRecipeDetails(BuildContext context, String recipeId) {
    context.go('/recipe/$recipeId');
  }

  void _navigateToCreateRecipe(BuildContext context) {
    context.go('/create');
  }

  void _toggleFavorite(Recipe recipe) {
    ref.read(recipeListControllerProvider.notifier)
        .toggleFavorite(recipe.id);
  }
}