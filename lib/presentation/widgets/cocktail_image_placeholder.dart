import 'package:flutter/material.dart';

/// A placeholder widget for when a cocktail image is not available
class CocktailImagePlaceholder extends StatelessWidget {
  /// Whether to display the "No Image Available" text
  final bool showText;
  
  /// The size of the cocktail glass icon
  final double iconSize;
  
  /// The background color of the placeholder
  final Color? backgroundColor;
  
  /// Creates a new CocktailImagePlaceholder
  const CocktailImagePlaceholder({
    super.key,
    this.showText = true,
    this.iconSize = 70,
    this.backgroundColor,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor = backgroundColor ?? theme.colorScheme.surfaceVariant;
    
    return Container(
      width: double.infinity,
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cocktail glass icon with decorative elements
            Stack(
              alignment: Alignment.center,
              children: [
                // Decorative circle behind the glass
                Container(
                  width: iconSize * 1.3,
                  height: iconSize * 1.3,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    shape: BoxShape.circle,
                  ),
                ),
                // Cocktail glass icon
                Icon(
                  Icons.local_bar,
                  size: iconSize,
                  color: theme.colorScheme.secondary,
                ),
                // Small decorative elements (like olives or citrus)
                Positioned(
                  top: iconSize * 0.2,
                  right: iconSize * 0.2,
                  child: Container(
                    width: iconSize * 0.2,
                    height: iconSize * 0.2,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withAlpha(220),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Decorative lime slice
                Positioned(
                  bottom: iconSize * 0.3,
                  right: iconSize * 0.25,
                  child: Transform.rotate(
                    angle: 0.4,
                    child: Icon(
                      Icons.brightness_1_outlined,
                      size: iconSize * 0.25,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ),
              ],
            ),
            // "No Image Available" text (optional)
            if (showText) ...[
              const SizedBox(height: 12),
              Text(
                'No Image Available',
                style: TextStyle(
                  fontSize: 14, 
                  color: theme.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}