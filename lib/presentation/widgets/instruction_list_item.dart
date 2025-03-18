import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A widget that displays an instruction item in the recipe detail screen
class InstructionListItem extends StatelessWidget {
  /// The instruction to display
  final Instruction instruction;
  
  /// Creates a new instruction list item
  const InstructionListItem({
    super.key,
    required this.instruction,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 12, top: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${instruction.step}',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          
          // Instruction text
          Expanded(
            child: MarkdownBody(
              data: instruction.value,
              styleSheet: MarkdownStyleSheet(
                p: theme.textTheme.bodyMedium,
                blockquote: theme.textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.secondary,
                ),
                em: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.secondary,
                ),
                strong: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}