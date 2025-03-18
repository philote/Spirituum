import 'package:flutter/material.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/presentation/widgets/cocktail_image_placeholder.dart';

/// A widget that displays a recipe in a list view
class RecipeListItem extends StatelessWidget {
  /// The recipe to display
  final Recipe recipe;
  
  /// Callback when the item is tapped
  final VoidCallback onTap;
  
  /// Callback when the favorite button is tapped
  final VoidCallback onFavoriteToggle;
  
  /// Creates a new recipe list item
  const RecipeListItem({
    super.key,
    required this.recipe,
    required this.onTap,
    required this.onFavoriteToggle,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Recipe image (if available) or placeholder
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: recipe.imagePath != null && recipe.imagePath!.isNotEmpty
                      ? Image.asset(
                          recipe.imagePath!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _buildImagePlaceholder(context),
                        )
                      : _buildImagePlaceholder(context),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Recipe info
              Expanded(
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
                    
                    const SizedBox(height: 4),
                    
                    // Tags (limited to 3)
                    if (recipe.tags.isNotEmpty) ...[
                      SizedBox(
                        height: 24,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipe.tags.length > 3 ? 3 : recipe.tags.length,
                          separatorBuilder: (context, _) => const SizedBox(width: 4),
                          itemBuilder: (context, index) {
                            final tag = recipe.tags[index];
                            return Chip(
                              label: Text(
                                tag.value,
                                style: const TextStyle(fontSize: 11),
                              ),
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              backgroundColor: theme.colorScheme.secondaryContainer,
                            );
                          },
                        ),
                      ),
                    ],
                    
                    // Recipe type (alcoholic or non-alcoholic)
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          recipe.alcoholic ? Icons.liquor : Icons.local_drink,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          recipe.alcoholic ? 'Alcoholic' : 'Non-alcoholic',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Favorite button
              IconButton(
                icon: Icon(
                  recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: recipe.isFavorite ? theme.colorScheme.primary : null,
                ),
                onPressed: onFavoriteToggle,
                tooltip: recipe.isFavorite ? 'Remove from favorites' : 'Add to favorites',
                iconSize: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  /// Builds a placeholder for when the recipe has no image
  Widget _buildImagePlaceholder(BuildContext context) {
    return CocktailImagePlaceholder(
      showText: false,
      iconSize: 40,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant.withAlpha(180),
    );
  }
}