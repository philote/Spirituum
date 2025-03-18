import 'package:flutter/material.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A form item for editing an ingredient
class IngredientEditItem extends StatefulWidget {
  /// The ingredient to edit
  final Ingredient ingredient;
  
  /// The index of the ingredient in the list
  final int index;
  
  /// Called when the ingredient is updated
  final Function(Ingredient) onUpdate;
  
  /// Called when the ingredient is deleted
  final VoidCallback onDelete;
  
  /// Creates a new IngredientEditItem
  const IngredientEditItem({
    super.key,
    required this.ingredient,
    required this.index,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  State<IngredientEditItem> createState() => _IngredientEditItemState();
}

class _IngredientEditItemState extends State<IngredientEditItem> {
  late TextEditingController _nameController;
  late TextEditingController _amountValueController;
  late TextEditingController _amountLabelController;
  late TextEditingController _notesController;
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.ingredient.name);
    _amountValueController = TextEditingController(text: widget.ingredient.amount.value.toString());
    _amountLabelController = TextEditingController(text: widget.ingredient.amount.label);
    _notesController = TextEditingController(text: widget.ingredient.notes ?? '');
    
    // Add listeners to update the ingredient when text changes
    _nameController.addListener(_updateIngredient);
    _amountValueController.addListener(_updateIngredient);
    _amountLabelController.addListener(_updateIngredient);
    _notesController.addListener(_updateIngredient);
  }
  
  @override
  void didUpdateWidget(covariant IngredientEditItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update controllers if ingredient changes
    if (oldWidget.ingredient != widget.ingredient) {
      _nameController.text = widget.ingredient.name;
      _amountValueController.text = widget.ingredient.amount.value.toString();
      _amountLabelController.text = widget.ingredient.amount.label;
      _notesController.text = widget.ingredient.notes ?? '';
    }
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _amountValueController.dispose();
    _amountLabelController.dispose();
    _notesController.dispose();
    super.dispose();
  }
  
  void _updateIngredient() {
    if (_formKey.currentState?.validate() ?? false) {
      // Parse amount value, default to 0 if invalid
      final amountValue = double.tryParse(_amountValueController.text) ?? 0;
      
      final updatedIngredient = widget.ingredient.copyWith(
        name: _nameController.text,
        amount: Amount(
          value: amountValue,
          label: _amountLabelController.text,
        ),
        notes: _notesController.text.isEmpty ? null : _notesController.text,
      );
      
      widget.onUpdate(updatedIngredient);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ingredient #${widget.index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: widget.onDelete,
                    tooltip: 'Delete Ingredient',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Ingredient name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Ingredient Name',
                  hintText: 'e.g., Rum, Lime Juice',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              
              // Amount row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Amount value
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _amountValueController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        hintText: '1.5',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Enter a number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  
                  // Amount unit/label
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _amountLabelController,
                      decoration: const InputDecoration(
                        labelText: 'Unit',
                        hintText: 'oz, ml, tbsp',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      maxLength: null,
                      buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Unit is required';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Notes
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'e.g., Fresh squeezed, Overproof',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}