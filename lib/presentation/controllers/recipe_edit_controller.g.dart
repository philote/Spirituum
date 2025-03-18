// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipeEditControllerHash() =>
    r'86107bf1dc13b01971fcd07ea034e5e287aa8f3c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RecipeEditController
    extends BuildlessAutoDisposeAsyncNotifier<Recipe?> {
  late final String? recipeId;

  FutureOr<Recipe?> build(String? recipeId);
}

/// A controller for editing and creating recipes
///
/// Copied from [RecipeEditController].
@ProviderFor(RecipeEditController)
const recipeEditControllerProvider = RecipeEditControllerFamily();

/// A controller for editing and creating recipes
///
/// Copied from [RecipeEditController].
class RecipeEditControllerFamily extends Family<AsyncValue<Recipe?>> {
  /// A controller for editing and creating recipes
  ///
  /// Copied from [RecipeEditController].
  const RecipeEditControllerFamily();

  /// A controller for editing and creating recipes
  ///
  /// Copied from [RecipeEditController].
  RecipeEditControllerProvider call(String? recipeId) {
    return RecipeEditControllerProvider(recipeId);
  }

  @override
  RecipeEditControllerProvider getProviderOverride(
    covariant RecipeEditControllerProvider provider,
  ) {
    return call(provider.recipeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipeEditControllerProvider';
}

/// A controller for editing and creating recipes
///
/// Copied from [RecipeEditController].
class RecipeEditControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<RecipeEditController, Recipe?> {
  /// A controller for editing and creating recipes
  ///
  /// Copied from [RecipeEditController].
  RecipeEditControllerProvider(String? recipeId)
    : this._internal(
        () => RecipeEditController()..recipeId = recipeId,
        from: recipeEditControllerProvider,
        name: r'recipeEditControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$recipeEditControllerHash,
        dependencies: RecipeEditControllerFamily._dependencies,
        allTransitiveDependencies:
            RecipeEditControllerFamily._allTransitiveDependencies,
        recipeId: recipeId,
      );

  RecipeEditControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.recipeId,
  }) : super.internal();

  final String? recipeId;

  @override
  FutureOr<Recipe?> runNotifierBuild(covariant RecipeEditController notifier) {
    return notifier.build(recipeId);
  }

  @override
  Override overrideWith(RecipeEditController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecipeEditControllerProvider._internal(
        () => create()..recipeId = recipeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        recipeId: recipeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RecipeEditController, Recipe?>
  createElement() {
    return _RecipeEditControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipeEditControllerProvider && other.recipeId == recipeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, recipeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecipeEditControllerRef on AutoDisposeAsyncNotifierProviderRef<Recipe?> {
  /// The parameter `recipeId` of this provider.
  String? get recipeId;
}

class _RecipeEditControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<RecipeEditController, Recipe?>
    with RecipeEditControllerRef {
  _RecipeEditControllerProviderElement(super.provider);

  @override
  String? get recipeId => (origin as RecipeEditControllerProvider).recipeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
