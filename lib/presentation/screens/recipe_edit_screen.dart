import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/presentation/controllers/recipe_edit_controller.dart';
import 'package:spirituum/presentation/widgets/ingredient_edit_item.dart';
import 'package:spirituum/presentation/widgets/instruction_edit_item.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'dart:convert';

/// Screen for creating or editing a recipe
class RecipeEditScreen extends ConsumerStatefulWidget {
  /// The ID of the recipe to edit, or null if creating a new recipe
  final String? recipeId;

  /// Creates a new recipe edit screen
  ///
  /// If [recipeId] is provided, the screen will edit an existing recipe.
  /// Otherwise, it will create a new recipe.
  const RecipeEditScreen({super.key, this.recipeId});

  @override
  ConsumerState<RecipeEditScreen> createState() => _RecipeEditScreenState();
}

class _RecipeEditScreenState extends ConsumerState<RecipeEditScreen> {
  // Form controllers and state
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _altNameController = TextEditingController();
  final _glasswareController = TextEditingController();
  final _garnishController = TextEditingController();
  final _tagController = TextEditingController();
  late QuillController _aboutController;
  late QuillController _notesController;
  bool _alcoholic = false;

  @override
  void initState() {
    super.initState();
    // Initialize the rich text editors with empty content
    _aboutController = QuillController.basic();
    _notesController = QuillController.basic();

    // Add listeners to update the recipe
    _nameController.addListener(() {
      _updateRecipeFromForm();
    });

    _altNameController.addListener(() {
      _updateRecipeFromForm();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _altNameController.dispose();
    _glasswareController.dispose();
    _garnishController.dispose();
    _tagController.dispose();
    _aboutController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // Helper method to convert Quill Delta to JSON string
  String _quillDeltaToJson(QuillController controller) {
    final plainText = controller.document.toPlainText().trim();
    if (plainText.isEmpty) return '';

    return jsonEncode(controller.document.toDelta().toJson());
  }

  // Helper method to set Quill controller from JSON string
  void _setQuillControllerFromJson(
    QuillController controller,
    String? jsonString,
  ) {
    if (jsonString == null || jsonString.isEmpty) {
      controller.clear();
      return;
    }

    try {
      final dynamic delta = jsonDecode(jsonString);
      controller.document = Document.fromJson(delta);
    } catch (e) {
      // If JSON parsing fails, treat it as plain text
      controller.document = Document();
      controller.document.insert(0, jsonString);
    }
  }

  // Update the form with recipe data
  void _updateFormWithRecipe(Recipe recipe) {
    if (_nameController.text != recipe.name) {
      _nameController.text = recipe.name;
    }
    if (_altNameController.text != (recipe.altName ?? '')) {
      _altNameController.text = recipe.altName ?? '';
    }
    _glasswareController.text = recipe.glassware ?? '';
    _garnishController.text = recipe.garnish ?? '';
    _alcoholic = recipe.alcoholic;

    // Set rich text fields
    _setQuillControllerFromJson(_aboutController, recipe.about);
    _setQuillControllerFromJson(_notesController, recipe.notes);
  }

  // Create or update a recipe from form data
  Recipe _buildRecipeFromForm(Recipe? existingRecipe) {
    final name = _nameController.text.trim();
    final altName = _altNameController.text.trim();
    final glassware = _glasswareController.text.trim();
    final garnish = _garnishController.text.trim();
    final about = _quillDeltaToJson(_aboutController);
    final notes = _quillDeltaToJson(_notesController);

    if (existingRecipe == null) {
      return Recipe.create(
        name: name,
        altName: altName.isEmpty ? null : altName,
        glassware: glassware.isEmpty ? null : glassware,
        garnish: garnish.isEmpty ? null : garnish,
        alcoholic: _alcoholic,
        about: about.isEmpty ? null : about,
        notes: notes.isEmpty ? null : notes,
      );
    } else {
      return existingRecipe.copyWith(
        name: name,
        altName: altName.isEmpty ? null : altName,
        glassware: glassware.isEmpty ? null : glassware,
        garnish: garnish.isEmpty ? null : garnish,
        alcoholic: _alcoholic,
        about: about.isEmpty ? null : about,
        notes: notes.isEmpty ? null : notes,
        updatedAt: DateTime.now(),
      );
    }
  }

  // Add a new tag to the recipe
  void _addTag(Recipe recipe) {
    if (_tagController.text.trim().isEmpty) return;

    ref
        .read(recipeEditControllerProvider(widget.recipeId).notifier)
        .addTag(recipe, _tagController.text.trim());
    _tagController.clear();
  }

  // Update recipe from form data when text fields change
  void _updateRecipeFromForm() {
    ref.read(recipeEditControllerProvider(widget.recipeId)).whenData((recipe) {
      if (recipe == null) return;

      final name = _nameController.text.trim();
      final altName = _altNameController.text.trim();

      // Only update if values are different
      if (name != recipe.name ||
          (altName.isEmpty
              ? recipe.altName != null
              : altName != recipe.altName)) {
        final updatedRecipe = recipe.copyWith(
          name: name,
          altName: altName.isEmpty ? null : altName,
        );

        ref
            .read(recipeEditControllerProvider(widget.recipeId).notifier)
            .updateRecipe(updatedRecipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the recipe edit controller
    final recipeAsync = ref.watch(
      recipeEditControllerProvider(widget.recipeId),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipeId == null ? 'Create Recipe' : 'Edit Recipe'),
        actions: [
          // Save button
          TextButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                recipeAsync.whenData((recipe) async {
                  if (recipe != null) {
                    final updatedRecipe = _buildRecipeFromForm(recipe);
                    await ref
                        .read(
                          recipeEditControllerProvider(
                            widget.recipeId,
                          ).notifier,
                        )
                        .saveRecipe(updatedRecipe);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Recipe saved')),
                      );
                      context.pop();
                    }
                  }
                });
              }
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
      body: recipeAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (recipe) {
          if (recipe == null) {
            return const Center(child: Text('Recipe not found'));
          }

          // Update form fields with recipe data when it loads
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _updateFormWithRecipe(recipe);
          });

          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Recipe name (required)
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Recipe Name',
                      hintText: 'Enter recipe name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Recipe name is required';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  // Alternative name (optional)
                  TextFormField(
                    controller: _altNameController,
                    decoration: const InputDecoration(
                      labelText: 'Alternative Name (optional)',
                      hintText: 'Enter alternative name',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  // Alcoholic toggle
                  SwitchListTile(
                    title: const Text('Alcoholic'),
                    value: _alcoholic,
                    onChanged: (value) {
                      setState(() {
                        _alcoholic = value;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 16),

                  // Glassware
                  TextFormField(
                    controller: _glasswareController,
                    decoration: const InputDecoration(
                      labelText: 'Glassware',
                      hintText: 'e.g., Rocks Glass, Martini Glass',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.wine_bar),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),

                  // Garnish
                  TextFormField(
                    controller: _garnishController,
                    decoration: const InputDecoration(
                      labelText: 'Garnish',
                      hintText: 'e.g., Lemon twist, Orange peel',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.eco),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 24),

                  // About (rich text)
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        QuillSimpleToolbar(controller: _aboutController),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withAlpha(127),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: QuillEditor.basic(
                            controller: _aboutController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tags
                  const Text(
                    'Tags',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _tagController,
                          decoration: const InputDecoration(
                            labelText: 'Add Tag',
                            hintText: 'Enter tag name',
                            border: OutlineInputBorder(),
                          ),
                          onFieldSubmitted: (_) => _addTag(recipe),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _addTag(recipe),
                        tooltip: 'Add Tag',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (recipe.tags.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      children:
                          recipe.tags.asMap().entries.map((entry) {
                            return Chip(
                              label: Text(entry.value.value),
                              onDeleted: () {
                                ref
                                    .read(
                                      recipeEditControllerProvider(
                                        widget.recipeId,
                                      ).notifier,
                                    )
                                    .removeTag(recipe, entry.key);
                              },
                              backgroundColor:
                                  Theme.of(
                                    context,
                                  ).colorScheme.primaryContainer,
                            );
                          }).toList(),
                    ),
                  const SizedBox(height: 24),

                  // Ingredients
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .addIngredient(recipe);
                        },
                        tooltip: 'Add Ingredient',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: IngredientEditItem(
                        ingredient: entry.value,
                        index: entry.key,
                        onUpdate: (ingredient) {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .updateIngredient(recipe, entry.key, ingredient);
                        },
                        onDelete: () {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .removeIngredient(recipe, entry.key);
                        },
                      ),
                    );
                  }),
                  if (recipe.ingredients.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'No ingredients added yet. Tap + to add one.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  const SizedBox(height: 24),

                  // Instructions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .addInstruction(recipe);
                        },
                        tooltip: 'Add Instruction',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...recipe.instructions.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: InstructionEditItem(
                        instruction: entry.value,
                        index: entry.key,
                        onUpdate: (instruction) {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .updateInstruction(
                                recipe,
                                entry.key,
                                instruction,
                              );
                        },
                        onDelete: () {
                          ref
                              .read(
                                recipeEditControllerProvider(
                                  widget.recipeId,
                                ).notifier,
                              )
                              .removeInstruction(recipe, entry.key);
                        },
                      ),
                    );
                  }),
                  if (recipe.instructions.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'No instructions added yet. Tap + to add one.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  const SizedBox(height: 24),

                  // Notes (rich text)
                  const Text(
                    'Notes (Optional)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        QuillSimpleToolbar(controller: _notesController),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withAlpha(127),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: QuillEditor.basic(
                            controller: _notesController,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
