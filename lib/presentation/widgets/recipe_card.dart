import 'package:flutter/material.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A card widget that displays a recipe preview
///
/// Shows the recipe name, image (if available), and favorite status
class RecipeCard extends StatelessWidget {
  /// The recipe to display
  final Recipe recipe;
  
  /// Callback when the favorite button is pressed
  final VoidCallback onToggleFavorite;
  
  /// Callback when the card is tapped
  final VoidCallback onTap;
  
  /// Creates a recipe card widget
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe image or placeholder
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _buildRecipeImage(),
            ),
            
            // Recipe information
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Recipe name
                      Expanded(
                        child: Text(
                          recipe.name,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      // Favorite button
                      IconButton(
                        icon: Icon(
                          recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: recipe.isFavorite ? Colors.red : null,
                        ),
                        onPressed: onToggleFavorite,
                        tooltip: recipe.isFavorite ? 'Remove from favorites' : 'Add to favorites',
                        iconSize: 22,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                  
                  // Tags
                  if (recipe.tags.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    _buildTags(context),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the recipe image or a placeholder
  Widget _buildRecipeImage() {
    if (recipe.imagePath != null && recipe.imagePath!.isNotEmpty) {
      return Image.network(
        recipe.imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
      );
    }
    return _buildPlaceholderImage();
  }

  /// Builds a placeholder image
  Widget _buildPlaceholderImage() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.local_bar,
          size: 48,
          color: Colors.white70,
        ),
      ),
    );
  }

  /// Builds tags for the recipe
  Widget _buildTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: recipe.tags
          .take(3) // Show at most 3 tags
          .map((tag) => Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                label: Text(
                  tag.value,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                padding: EdgeInsets.zero,
              ))
          .toList(),
    );
  }
}