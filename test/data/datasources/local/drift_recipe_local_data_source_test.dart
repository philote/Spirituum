import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:spirituum/data/datasources/local/app_database.dart' as db;
import 'package:spirituum/data/datasources/local/drift_recipe_local_data_source.dart';
import 'package:spirituum/domain/models/recipe.dart' as domain;
import 'package:uuid/uuid.dart';

// Custom database class for testing that uses in-memory database
class TestDatabase extends db.AppDatabase {
  TestDatabase() : super.connect(NativeDatabase.memory());
}

void main() {
  late TestDatabase database;
  late DriftRecipeLocalDataSource dataSource;

  setUpAll(() {
    // Initialize Flutter bindings
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    database = TestDatabase();
    dataSource = DriftRecipeLocalDataSource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('Database can be opened', () {
    expect(database, isNotNull);
  });

  test('Database can count recipes', () async {
    final count = await database.countRecipes();
    expect(count, isNotNull);
  });

  test('Database can save and retrieve a recipe', () async {
    // Create a test recipe
    final testRecipe = domain.Recipe.create(
      name: 'Test Martini',
      altName: 'Test Classic Martini',
      about: 'A test recipe for a classic martini',
      alcoholic: true,
      glassware: 'Martini glass',
      garnish: 'Olive or lemon twist',
      tags: [
        const domain.Tag(value: 'Gin'),
        const domain.Tag(value: 'Vermouth'),
        const domain.Tag(value: 'Classic'),
      ],
      instructions: [
        const domain.Instruction(value: 'Add ice to a mixing glass', step: 1),
        const domain.Instruction(value: 'Add gin and vermouth', step: 2),
        const domain.Instruction(value: 'Stir well until chilled', step: 3),
        const domain.Instruction(value: 'Strain into a chilled martini glass', step: 4),
        const domain.Instruction(value: 'Garnish with olive or lemon twist', step: 5),
      ],
      ingredients: [
        domain.Ingredient(
          name: 'Gin',
          amount: const domain.Amount(value: 60, label: 'ml'),
          notes: 'Use a quality London dry gin',
        ),
        domain.Ingredient(
          name: 'Dry Vermouth',
          amount: const domain.Amount(value: 15, label: 'ml'),
          notes: 'Quality dry vermouth is essential',
        ),
      ],
    );

    // Save the recipe
    await dataSource.saveRecipe(testRecipe);

    // Retrieve the recipe
    final retrievedRecipe = await dataSource.getRecipeById(testRecipe.id);

    // Verify the recipe was saved correctly
    expect(retrievedRecipe, isNotNull);
    expect(retrievedRecipe!.name, equals('Test Martini'));
    expect(retrievedRecipe.altName, equals('Test Classic Martini'));
    expect(retrievedRecipe.alcoholic, isTrue);
    
    // Check tags were saved
    expect(retrievedRecipe.tags.length, equals(3));
    expect(retrievedRecipe.tags.map((t) => t.value).contains('Gin'), isTrue);
    expect(retrievedRecipe.tags.map((t) => t.value).contains('Vermouth'), isTrue);
    expect(retrievedRecipe.tags.map((t) => t.value).contains('Classic'), isTrue);
    
    // Check instructions were saved in order
    expect(retrievedRecipe.instructions.length, equals(5));
    expect(retrievedRecipe.instructions[0].step, equals(1));
    expect(retrievedRecipe.instructions[1].step, equals(2));
    expect(retrievedRecipe.instructions[4].step, equals(5));
    
    // Check ingredients were saved
    expect(retrievedRecipe.ingredients.length, equals(2));
    expect(retrievedRecipe.ingredients.map((i) => i.name).contains('Gin'), isTrue);
    expect(retrievedRecipe.ingredients.map((i) => i.name).contains('Dry Vermouth'), isTrue);
    
    // Check specific ingredient details
    final gin = retrievedRecipe.ingredients.firstWhere((i) => i.name == 'Gin');
    expect(gin.amount.value, equals(60));
    expect(gin.amount.label, equals('ml'));
    expect(gin.notes, equals('Use a quality London dry gin'));
  });

  test('Database can favorite and unfavorite a recipe', () async {
    // Create a test recipe
    final testId = const Uuid().v4();
    final testRecipe = domain.Recipe(
      id: testId,
      name: 'Test Recipe',
      isFavorite: false,
    );

    // Save the recipe
    await dataSource.saveRecipe(testRecipe);

    // Favorite the recipe
    await dataSource.setFavorite(testId, true);
    final favorited = await dataSource.getRecipeById(testId);
    expect(favorited!.isFavorite, isTrue);

    // Unfavorite the recipe
    await dataSource.setFavorite(testId, false);
    final unfavorited = await dataSource.getRecipeById(testId);
    expect(unfavorited!.isFavorite, isFalse);
  });

  test('Database can search recipes', () async {
    // Create test recipes
    final recipe1 = domain.Recipe.create(
      name: 'Gin Fizz',
      about: 'A refreshing gin cocktail',
      alcoholic: true,
    );
    final recipe2 = domain.Recipe.create(
      name: 'Whiskey Sour',
      about: 'A classic whiskey cocktail',
      alcoholic: true,
    );

    // Save the recipes
    await dataSource.saveRecipe(recipe1);
    await dataSource.saveRecipe(recipe2);

    // Search for gin
    final ginResults = await dataSource.searchRecipes('gin');
    expect(ginResults.length, equals(1));
    expect(ginResults[0].name, equals('Gin Fizz'));

    // Search for classic
    final classicResults = await dataSource.searchRecipes('classic');
    expect(classicResults.length, equals(1));
    expect(classicResults[0].name, equals('Whiskey Sour'));

    // Search for cocktail (should find both)
    final cocktailResults = await dataSource.searchRecipes('cocktail');
    expect(cocktailResults.length, equals(2));
  });
}