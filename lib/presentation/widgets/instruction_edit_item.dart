import 'package:flutter/material.dart';
import 'package:spirituum/domain/models/recipe.dart';

/// A form item for editing an instruction
class InstructionEditItem extends StatefulWidget {
  /// The instruction to edit
  final Instruction instruction;
  
  /// The index of the instruction in the list
  final int index;
  
  /// Called when the instruction is updated
  final Function(Instruction) onUpdate;
  
  /// Called when the instruction is deleted
  final VoidCallback onDelete;
  
  /// Creates a new InstructionEditItem
  const InstructionEditItem({
    super.key,
    required this.instruction,
    required this.index,
    required this.onUpdate,
    required this.onDelete,
  });

  @override
  State<InstructionEditItem> createState() => _InstructionEditItemState();
}

class _InstructionEditItemState extends State<InstructionEditItem> {
  late TextEditingController _valueController;
  final _formKey = GlobalKey<FormState>();
  
  @override
  void initState() {
    super.initState();
    _valueController = TextEditingController(text: widget.instruction.value);
    
    // Add listener to update the instruction when text changes
    _valueController.addListener(_updateInstruction);
  }
  
  @override
  void didUpdateWidget(covariant InstructionEditItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update controller if instruction changes
    if (oldWidget.instruction != widget.instruction) {
      _valueController.text = widget.instruction.value;
    }
  }
  
  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }
  
  void _updateInstruction() {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedInstruction = widget.instruction.copyWith(
        value: _valueController.text,
      );
      
      widget.onUpdate(updatedInstruction);
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
                      'Step ${widget.instruction.step}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: widget.onDelete,
                    tooltip: 'Delete Step',
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Instruction text
              TextFormField(
                controller: _valueController,
                decoration: const InputDecoration(
                  labelText: 'Instruction',
                  hintText: 'Describe this step',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Instruction text is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}