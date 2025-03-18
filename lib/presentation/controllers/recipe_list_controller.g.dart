// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeListControllerHash() =>
    r'e65bb41b1a22acf5ffb60b6794c0c8e89f748823';

/// Controller for the recipe list screen
///
/// Manages the state and business logic for displaying recipes
///
/// Copied from [RecipeListController].
@ProviderFor(RecipeListController)
final recipeListControllerProvider = AutoDisposeAsyncNotifierProvider<
  RecipeListController,
  List<Recipe>
>.internal(
  RecipeListController.new,
  name: r'recipeListControllerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$recipeListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecipeListController = AutoDisposeAsyncNotifier<List<Recipe>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
