import 'package:flutter/material.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/presentation/widgets/cocktail_image_placeholder.dart';

/// A widget that displays a recipe in a grid view
class RecipeGridItem extends StatelessWidget {
  /// The recipe to display
  final Recipe recipe;

  /// Callback when the item is tapped
  final VoidCallback onTap;

  /// Callback when the favorite button is tapped
  final VoidCallback onFavoriteToggle;

  /// Creates a new recipe grid item
  const RecipeGridItem({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe image (if available) or placeholder
            Stack(
              children: [
                // Image or placeholder
                SizedBox(
                  width: double.infinity,
                  height: 120,
                  child:
                      recipe.imagePath != null && recipe.imagePath!.isNotEmpty
                          ? Image.asset(
                            recipe.imagePath!,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    _buildImagePlaceholder(context),
                          )
                          : _buildImagePlaceholder(context),
                ),

                // Favorite button (positioned in top-right corner)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onFavoriteToggle,
                      borderRadius: BorderRadius.circular(24),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          recipe.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              recipe.isFavorite
                                  ? theme.colorScheme.primary
                                  : Colors.white,
                          size: 24,
                          shadows: const [
                            Shadow(color: Colors.black45, blurRadius: 3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Alcoholic indicator
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(179),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          recipe.alcoholic ? Icons.liquor : Icons.local_drink,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          recipe.alcoholic ? 'Alcoholic' : 'Non-alc',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe name
                  Text(
                    recipe.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Alternate name (if available)
                  if (recipe.altName != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      recipe.altName!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],

                  const SizedBox(height: 8),

                  // Show one tag or a count of tags
                  if (recipe.tags.isNotEmpty) ...[
                    recipe.tags.length == 1
                        ? Chip(
                          label: Text(
                            recipe.tags.first.value,
                            style: const TextStyle(fontSize: 11),
                          ),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                          backgroundColor: theme.colorScheme.secondaryContainer,
                        )
                        : Text(
                          '${recipe.tags.length} tags',
                          style: theme.textTheme.bodySmall,
                        ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a placeholder for when the recipe has no image
  Widget _buildImagePlaceholder(BuildContext context) {
    return CocktailImagePlaceholder(
      showText: false,
      iconSize: 50,
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surfaceContainerHighest.withAlpha(180),
    );
  }
}
