import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A widget that displays an ingredient item in the recipe detail screen
class IngredientListItem extends StatelessWidget {
  /// The ingredient to display
  final Ingredient ingredient;
  
  /// Creates a new ingredient list item
  const IngredientListItem({
    super.key,
    required this.ingredient,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Amount and unit
          SizedBox(
            width: 80,
            child: Text(
              '${ingredient.amount.value} ${ingredient.amount.label}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Name and notes
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ingredient name
                Text(
                  ingredient.name,
                  style: theme.textTheme.bodyMedium,
                ),
                
                // Notes (if available)
                if (ingredient.notes != null && ingredient.notes!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  MarkdownBody(
                    data: ingredient.notes!,
                    styleSheet: MarkdownStyleSheet(
                      p: theme.textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}