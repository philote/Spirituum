import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/data/repositories/recipe_repository_impl.dart';
import 'package:spirituum/presentation/widgets/ingredient_list_item.dart';
import 'package:spirituum/presentation/widgets/instruction_list_item.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spirituum/presentation/widgets/cocktail_image_placeholder.dart';
import 'package:spirituum/presentation/controllers/recipe_list_controller.dart';
import 'package:spirituum/presentation/controllers/recipe_provider.dart';

/// A screen that displays the details of a recipe
class RecipeDetailScreen extends ConsumerWidget {
  /// The ID of the recipe to display
  final String recipeId;

  /// Creates a new RecipeDetailScreen
  const RecipeDetailScreen({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the recipe async value
    // Use .watch instead of .read to make sure the widget rebuilds when the data changes
    final AsyncValue<Recipe?> recipeAsync = ref.watch(recipeProvider(recipeId));
    
    // Debug output to help troubleshoot
    if (recipeAsync.hasError) {
      debugPrint('Error loading recipe: ${recipeAsync.error}');
      debugPrint('Recipe ID: $recipeId');
    }
    
    return Scaffold(
      appBar: AppBar(
        title: recipeAsync.maybeWhen(
          data: (recipe) => Text(recipe?.name ?? 'Recipe Details'),
          orElse: () => const Text('Recipe Details'),
        ),
        actions: [
          // Only show actions if recipe is loaded
          if (recipeAsync.hasValue && recipeAsync.value != null) ...[
            // Toggle favorite button
            IconButton(
              icon: Icon(
                recipeAsync.value!.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: recipeAsync.value!.isFavorite
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              onPressed: () => _toggleFavorite(context, ref, recipeId),
              tooltip: recipeAsync.value!.isFavorite
                  ? 'Remove from favorites'
                  : 'Add to favorites',
            ),
            // Edit button
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _navigateToEdit(context, recipeId),
              tooltip: 'Edit recipe',
            ),
            // Share button
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _shareRecipe(recipeAsync.value!),
              tooltip: 'Share recipe',
            ),
            // More options menu
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'delete') {
                  _showDeleteConfirmation(context, ref, recipeId);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
              tooltip: 'More options',
            ),
          ],
        ],
      ),
      body: recipeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error loading recipe: $error'),
        ),
        data: (recipe) {
          if (recipe == null) {
            return const Center(
              child: Text('Recipe not found'),
            );
          }
          return _buildRecipeDetails(context, recipe);
        },
      ),
    );
  }

  Widget _buildRecipeDetails(BuildContext context, Recipe recipe) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe image (if available)
          if (recipe.imagePath != null && recipe.imagePath!.isNotEmpty) ...[
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                recipe.imagePath!, 
                fit: BoxFit.cover,
                semanticLabel: 'Image of ${recipe.name} cocktail',
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Error loading image: $error');
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, size: 50),
                    ),
                  );
                },
              ),
            )
          ] else ...[
            // Placeholder for when there's no image
            SizedBox(
              width: double.infinity,
              height: 180,
              child: CocktailImagePlaceholder(),
            ),
          ],

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipe name and alternate name
                Text(
                  recipe.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                  semanticsLabel: 'Recipe name: ${recipe.name}',
                ),
                if (recipe.altName != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    recipe.altName!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    semanticsLabel: 'Also known as ${recipe.altName}',
                  ),
                ],

                // Tags
                if (recipe.tags.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Semantics(
                    label: 'Recipe tags: ${recipe.tags.map((t) => t.value).join(", ")}',
                    child: SizedBox(
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipe.tags.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (context, index) {
                          return Chip(
                            label: Text(recipe.tags[index].value),
                            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          );
                        },
                      ),
                    ),
                  ),
                ],

                // About section
                if (recipe.about != null && recipe.about!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Semantics(
                    label: 'About this cocktail',
                    child: MarkdownBody(data: recipe.about!),
                  ),
                ],

                // Glassware and garnish
                const SizedBox(height: 24),
                _buildInfoRow(
                  context,
                  'Glassware',
                  recipe.glassware ?? 'Not specified',
                  Icons.wine_bar,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  'Garnish',
                  recipe.garnish ?? 'No garnish',
                  Icons.eco,
                ),
                const SizedBox(height: 8),
                _buildInfoRow(
                  context,
                  'Type',
                  recipe.alcoholic ? 'Alcoholic' : 'Non-alcoholic',
                  recipe.alcoholic ? Icons.liquor : Icons.local_drink,
                ),

                // Ingredients section
                const SizedBox(height: 24),
                Semantics(
                  label: 'Ingredients section',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ingredients',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      ...recipe.ingredients.map((ingredient) {
                        return IngredientListItem(ingredient: ingredient);
                      }),
                    ],
                  ),
                ),

                // Instructions section
                const SizedBox(height: 24),
                Semantics(
                  label: 'Instructions section',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Instructions',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      ...recipe.instructions
                          .asMap()
                          .entries
                          .map((entry) {
                        return InstructionListItem(instruction: entry.value);
                      }),
                    ],
                  ),
                ),

                // Notes section (if available)
                if (recipe.notes != null && recipe.notes!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Text(
                    'Notes',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Semantics(
                    label: 'Recipe notes',
                    child: MarkdownBody(data: recipe.notes!),
                  ),
                ],

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon) {
    return Semantics(
      label: '$label: $value',
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _toggleFavorite(BuildContext context, WidgetRef ref, String recipeId) async {
    // Debug to track our process
    debugPrint('Toggling favorite for recipe: $recipeId');
    
    // Use the same controller as the list view to toggle favorites
    await ref.read(recipeListControllerProvider.notifier).toggleFavorite(recipeId);
    
    // Also invalidate the recipe provider to ensure the detail view updates
    ref.invalidate(recipeProvider(recipeId));
    
    debugPrint('Favorite toggled and UI refreshed');
  }

  void _navigateToEdit(BuildContext context, String recipeId) {
    context.go('/recipe/$recipeId/edit');
  }
  
  void _shareRecipe(Recipe recipe) {
    // Create a text representation of the recipe to share
    final buffer = StringBuffer();
    
    buffer.writeln('Cocktail Recipe: ${recipe.name}');
    if (recipe.altName != null) {
      buffer.writeln('Also known as: ${recipe.altName}');
    }
    buffer.writeln();
    
    if (recipe.about != null && recipe.about!.isNotEmpty) {
      buffer.writeln('About:');
      buffer.writeln(recipe.about);
      buffer.writeln();
    }
    
    buffer.writeln('Type: ${recipe.alcoholic ? 'Alcoholic' : 'Non-alcoholic'}');
    if (recipe.glassware != null) {
      buffer.writeln('Glassware: ${recipe.glassware}');
    }
    if (recipe.garnish != null) {
      buffer.writeln('Garnish: ${recipe.garnish}');
    }
    buffer.writeln();
    
    buffer.writeln('INGREDIENTS:');
    for (final ingredient in recipe.ingredients) {
      buffer.write('• ${ingredient.amount.value} ${ingredient.amount.label} ${ingredient.name}');
      if (ingredient.notes != null && ingredient.notes!.isNotEmpty) {
        buffer.write(' (${ingredient.notes})');
      }
      buffer.writeln();
    }
    buffer.writeln();
    
    buffer.writeln('INSTRUCTIONS:');
    for (final instruction in recipe.instructions) {
      buffer.writeln('${instruction.step}. ${instruction.value}');
    }
    
    if (recipe.notes != null && recipe.notes!.isNotEmpty) {
      buffer.writeln();
      buffer.writeln('NOTES:');
      buffer.writeln(recipe.notes);
    }
    
    // Share the text
    Share.share(buffer.toString(), subject: 'Cocktail Recipe: ${recipe.name}');
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref, String recipeId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recipe'),
        content: const Text('Are you sure you want to delete this recipe? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              
              // Delete the recipe using the repository
              final repository = ref.read(recipeRepositoryProvider);
              
              // Add debug prints for troubleshooting
              debugPrint('Attempting to delete recipe with ID: $recipeId');
              
              await repository.deleteRecipe(recipeId);
              
              // Invalidate both the recipe provider and the recipe list provider to refresh the UI
              ref.invalidate(recipeProvider(recipeId));
              ref.invalidate(recipeListControllerProvider);
              
              debugPrint('Recipe deleted successfully, navigating to home');
              
              if (context.mounted) {
                context.go('/');
              }
            },
            child: const Text('DELETE'),
          ),
        ],
      ),
    );
  }
}