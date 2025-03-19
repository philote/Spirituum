import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:drift/drift.dart';
import 'package:spirituum/data/datasources/local/app_database.dart';

part 'database_service.g.dart';

/// Service class to manage the database lifecycle
class DatabaseService {
  AppDatabase? _database;

  /// Get the database instance, initializing it if necessary
  AppDatabase get database {
    _database ??= AppDatabase();
    return _database!;
  }

  /// Close the database connection
  Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }

  /// Initialize the database with sample data (for development purposes)
  Future<void> seedDatabaseIfEmpty() async {
    final recipeCount = await database.countRecipes();

    if (recipeCount == 0) {
      debugPrint('Seeding database with sample recipes...');
      await _seedSampleData();
    }
  }

  /// Seed the database with sample recipes
  Future<void> _seedSampleData() async {
    // Sample recipes for development testing
    final mojito = RecipesCompanion.insert(
      uuid: 'mojito-1',
      name: 'Mojito',
      altName: const Value('Classic Mojito'),
      imagePath: const Value(null),
      about: const Value(
        'A traditional Cuban highball with a refreshing mix of lime, mint, and rum.',
      ),
      notes: const Value('Best served in summer months.'),
      alcoholic: const Value(true),
      glassware: const Value('Highball glass'),
      garnish: const Value('Mint sprig and lime wedge'),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      userId: const Value('sample-user'),
      isPublic: const Value(true),
      isFavorite: const Value(false),
    );

    // Save mojito recipe
    final mojitoId = await database.into(database.recipes).insert(mojito);

    // Add tags
    final mintTagId = await database
        .into(database.tags)
        .insert(TagsCompanion.insert(value: 'Mint'));
    final rumTagId = await database
        .into(database.tags)
        .insert(TagsCompanion.insert(value: 'Rum'));
    final summerTagId = await database
        .into(database.tags)
        .insert(TagsCompanion.insert(value: 'Summer'));

    // Associate tags with recipe
    await database
        .into(database.recipeTags)
        .insert(
          RecipeTagsCompanion.insert(recipeId: mojitoId, tagId: mintTagId),
        );
    await database
        .into(database.recipeTags)
        .insert(
          RecipeTagsCompanion.insert(recipeId: mojitoId, tagId: rumTagId),
        );
    await database
        .into(database.recipeTags)
        .insert(
          RecipeTagsCompanion.insert(recipeId: mojitoId, tagId: summerTagId),
        );

    // Add instructions
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: mojitoId,
            value: 'Muddle mint leaves with sugar and lime juice in a glass.',
            step: 1,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: mojitoId,
            value:
                'Add a splash of soda water and fill the glass with cracked ice.',
            step: 2,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: mojitoId,
            value: 'Pour the rum and top with soda water.',
            step: 3,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: mojitoId,
            value: 'Garnish with mint leaves and a slice of lime.',
            step: 4,
          ),
        );

    // Add ingredients
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: mojitoId,
            name: 'White rum',
            amountValue: 60.0,
            amountLabel: 'ml',
            notes: const Value('Use a quality Cuban rum for best results'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: mojitoId,
            name: 'Mint leaves',
            amountValue: 8.0,
            amountLabel: 'leaves',
            notes: const Value('Fresh mint is essential'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: mojitoId,
            name: 'Lime',
            amountValue: 1.0,
            amountLabel: 'lime',
            notes: const Value('Juiced and cut into wedges'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: mojitoId,
            name: 'Sugar',
            amountValue: 2.0,
            amountLabel: 'tsp',
            notes: const Value('White sugar or simple syrup'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: mojitoId,
            name: 'Soda water',
            amountValue: 120.0,
            amountLabel: 'ml',
            notes: const Value(null),
          ),
        );

    // Add another sample recipe: Old Fashioned
    final oldFashioned = RecipesCompanion.insert(
      uuid: 'oldfashioned-1',
      name: 'Old Fashioned',
      altName: const Value(null),
      imagePath: const Value(null),
      about: const Value(
        'A sophisticated whiskey cocktail that\'s stood the test of time.',
      ),
      notes: const Value('Perfect for evening gatherings.'),
      alcoholic: const Value(true),
      glassware: const Value('Rocks glass'),
      garnish: const Value('Orange peel and cocktail cherry'),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      userId: const Value('sample-user'),
      isPublic: const Value(true),
      isFavorite: const Value(true),
    );

    // Save Old Fashioned recipe
    final oldFashionedId = await database
        .into(database.recipes)
        .insert(oldFashioned);

    // Add tags
    final whiskeyTagId = await database
        .into(database.tags)
        .insert(TagsCompanion.insert(value: 'Whiskey'));
    final classicTagId = await database
        .into(database.tags)
        .insert(TagsCompanion.insert(value: 'Classic'));

    // Associate tags with recipe
    await database
        .into(database.recipeTags)
        .insert(
          RecipeTagsCompanion.insert(
            recipeId: oldFashionedId,
            tagId: whiskeyTagId,
          ),
        );
    await database
        .into(database.recipeTags)
        .insert(
          RecipeTagsCompanion.insert(
            recipeId: oldFashionedId,
            tagId: classicTagId,
          ),
        );

    // Add instructions for Old Fashioned
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: oldFashionedId,
            value:
                'Place sugar cube in old-fashioned glass and saturate with bitters, add a dash of water.',
            step: 1,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: oldFashionedId,
            value: 'Muddle until dissolved.',
            step: 2,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: oldFashionedId,
            value: 'Fill the glass with ice cubes and add whiskey.',
            step: 3,
          ),
        );
    await database
        .into(database.instructions)
        .insert(
          InstructionsCompanion.insert(
            recipeId: oldFashionedId,
            value: 'Garnish with orange twist and cocktail cherry.',
            step: 4,
          ),
        );

    // Add ingredients for Old Fashioned
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: oldFashionedId,
            name: 'Bourbon or Rye whiskey',
            amountValue: 60.0,
            amountLabel: 'ml',
            notes: const Value('Use a high quality whiskey'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: oldFashionedId,
            name: 'Sugar cube',
            amountValue: 1.0,
            amountLabel: 'cube',
            notes: const Value('Or 1 tsp simple syrup'),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: oldFashionedId,
            name: 'Angostura bitters',
            amountValue: 2.0,
            amountLabel: 'dashes',
            notes: const Value(null),
          ),
        );
    await database
        .into(database.ingredients)
        .insert(
          IngredientsCompanion.insert(
            recipeId: oldFashionedId,
            name: 'Water',
            amountValue: 5.0,
            amountLabel: 'ml',
            notes: const Value('Just a splash'),
          ),
        );
  }
}

/// Provider for DatabaseService
@Riverpod(keepAlive: true)
DatabaseService databaseService(DatabaseServiceRef ref) {
  final service = DatabaseService();

  ref.onDispose(() async {
    // Close the database when the provider is disposed
    await service.close();
  });

  return service;
}

/// Provider for AppDatabase that uses DatabaseService
@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  return ref.watch(databaseServiceProvider).database;
}
