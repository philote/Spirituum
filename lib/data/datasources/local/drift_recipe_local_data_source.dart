import 'package:drift/drift.dart';
import 'package:spirituum/data/datasources/local/app_database.dart';
import 'package:spirituum/data/datasources/local/recipe_local_data_source.dart';
import 'package:spirituum/domain/models/recipe.dart' as domain;
import 'package:uuid/uuid.dart';

/// Implementation of RecipeLocalDataSource using Drift database
class DriftRecipeLocalDataSource implements RecipeLocalDataSource {
  final AppDatabase _database;
  final _uuid = const Uuid();

  /// Creates a new DriftRecipeLocalDataSource with the given database
  DriftRecipeLocalDataSource(this._database);

  /// Maps a Drift Recipe to a domain Recipe
  Future<domain.Recipe> _mapToDomainRecipe(Recipe dbRecipe) async {
    // Get tags for the recipe
    final tagsList = await _database.getTagsForRecipe(dbRecipe.id);
    final tags = tagsList.map((t) => domain.Tag(value: t.value)).toList();
    
    // Get instructions for the recipe
    final instructionsList = await _database.getInstructionsForRecipe(dbRecipe.id);
    final instructions = instructionsList.map((i) => 
      domain.Instruction(value: i.value, step: i.step)
    ).toList();
    
    // Get ingredients for the recipe
    final ingredientsList = await _database.getIngredientsForRecipe(dbRecipe.id);
    final ingredients = ingredientsList.map((i) =>
      domain.Ingredient(
        name: i.name, 
        amount: domain.Amount(value: i.amountValue, label: i.amountLabel),
        notes: i.notes
      )
    ).toList();
    
    // Create the domain recipe
    return domain.Recipe(
      id: dbRecipe.uuid,
      name: dbRecipe.name,
      altName: dbRecipe.altName,
      imagePath: dbRecipe.imagePath,
      about: dbRecipe.about,
      tags: tags,
      instructions: instructions,
      notes: dbRecipe.notes,
      alcoholic: dbRecipe.alcoholic,
      glassware: dbRecipe.glassware,
      garnish: dbRecipe.garnish,
      ingredients: ingredients,
      createdAt: dbRecipe.createdAt,
      updatedAt: dbRecipe.updatedAt,
      userId: dbRecipe.userId,
      isPublic: dbRecipe.isPublic,
      isFavorite: dbRecipe.isFavorite,
    );
  }

  /// Saves a domain Recipe to the database
  Future<void> _saveRecipeToDb(domain.Recipe recipe) async {
    // Transaction to ensure atomicity
    await _database.transaction(() async {
      // Check if we're updating an existing recipe or creating a new one
      late final int recipeId;
      
      if (recipe.id.isNotEmpty) {
        // Try to get the existing recipe
        final existingRecipe = await _database.getRecipeByUuid(recipe.id);
        
        if (existingRecipe != null) {
          // Update existing recipe
          await (_database.update(_database.recipes)
            ..where((r) => r.uuid.equals(recipe.id)))
            .write(RecipesCompanion(
              name: Value(recipe.name),
              altName: Value(recipe.altName),
              imagePath: Value(recipe.imagePath),
              about: Value(recipe.about),
              notes: Value(recipe.notes),
              alcoholic: Value(recipe.alcoholic),
              glassware: Value(recipe.glassware),
              garnish: Value(recipe.garnish),
              updatedAt: Value(DateTime.now()),
              userId: Value(recipe.userId),
              isPublic: Value(recipe.isPublic),
              isFavorite: Value(recipe.isFavorite),
            ));
          recipeId = existingRecipe.id;
        } else {
          // Recipe ID exists but recipe not found, create new with provided ID
          final recipeEntry = RecipesCompanion.insert(
            uuid: recipe.id,
            name: recipe.name,
            altName: Value(recipe.altName),
            imagePath: Value(recipe.imagePath),
            about: Value(recipe.about),
            notes: Value(recipe.notes),
            alcoholic: Value(recipe.alcoholic),
            glassware: Value(recipe.glassware),
            garnish: Value(recipe.garnish),
            createdAt: Value(recipe.createdAt ?? DateTime.now()),
            updatedAt: Value(recipe.updatedAt ?? DateTime.now()),
            userId: Value(recipe.userId),
            isPublic: Value(recipe.isPublic),
            isFavorite: Value(recipe.isFavorite),
          );
          recipeId = await _database.into(_database.recipes).insert(recipeEntry);
        }
      } else {
        // Create new recipe with new UUID
        final recipeEntry = RecipesCompanion.insert(
          uuid: _uuid.v4(),
          name: recipe.name,
          altName: Value(recipe.altName),
          imagePath: Value(recipe.imagePath),
          about: Value(recipe.about),
          notes: Value(recipe.notes),
          alcoholic: Value(recipe.alcoholic),
          glassware: Value(recipe.glassware),
          garnish: Value(recipe.garnish),
          createdAt: Value(recipe.createdAt ?? DateTime.now()),
          updatedAt: Value(recipe.updatedAt ?? DateTime.now()),
          userId: Value(recipe.userId),
          isPublic: Value(recipe.isPublic),
          isFavorite: Value(recipe.isFavorite),
        );
        recipeId = await _database.into(_database.recipes).insert(recipeEntry);
      }
      
      // Delete existing related entities before adding new ones
      await (_database.delete(_database.recipeTags)..where((rt) => rt.recipeId.equals(recipeId))).go();
      await (_database.delete(_database.instructions)..where((i) => i.recipeId.equals(recipeId))).go();
      await (_database.delete(_database.ingredients)..where((i) => i.recipeId.equals(recipeId))).go();
      
      // Save tags
      for (var tag in recipe.tags) {
        // Try to find existing tag
        final tagQuery = await (_database.select(_database.tags)
          ..where((t) => t.value.equals(tag.value)))
          .getSingleOrNull();
        
        final tagId = tagQuery != null 
            ? tagQuery.id 
            : await _database.into(_database.tags).insert(
                TagsCompanion.insert(value: tag.value));
        
        // Add recipe-tag association
        await _database.into(_database.recipeTags).insert(
          RecipeTagsCompanion.insert(recipeId: recipeId, tagId: tagId)
        );
      }
      
      // Save instructions
      for (var instruction in recipe.instructions) {
        await _database.into(_database.instructions).insert(
          InstructionsCompanion.insert(
            recipeId: recipeId,
            value: instruction.value,
            step: instruction.step
          )
        );
      }
      
      // Save ingredients
      for (var ingredient in recipe.ingredients) {
        await _database.into(_database.ingredients).insert(
          IngredientsCompanion.insert(
            recipeId: recipeId,
            name: ingredient.name,
            amountValue: ingredient.amount.value,
            amountLabel: ingredient.amount.label,
            notes: Value(ingredient.notes)
          )
        );
      }
    });
  }

  @override
  Future<List<domain.Recipe>> getAllRecipes() async {
    final dbRecipes = await _database.getAllRecipes();
    final List<domain.Recipe> recipes = [];
    
    for (final dbRecipe in dbRecipes) {
      recipes.add(await _mapToDomainRecipe(dbRecipe));
    }
    
    return recipes;
  }

  @override
  Future<domain.Recipe?> getRecipeById(String id) async {
    final dbRecipe = await _database.getRecipeByUuid(id);
    
    if (dbRecipe == null) {
      return null;
    }
    
    return _mapToDomainRecipe(dbRecipe);
  }

  @override
  Future<domain.Recipe> saveRecipe(domain.Recipe recipe) async {
    await _saveRecipeToDb(recipe);
    
    // If we're creating a new recipe (empty ID), we need to get it by name
    final String uuid = recipe.id.isEmpty ? 
        (await (_database.select(_database.recipes)
          ..where((r) => r.name.equals(recipe.name))
          ..orderBy([(r) => OrderingTerm(expression: r.createdAt, mode: OrderingMode.desc)]))
          .getSingle()).uuid : 
        recipe.id;
     
    final dbRecipe = await _database.getRecipeByUuid(uuid);
    if (dbRecipe == null) {
      throw Exception('Failed to save recipe');
    }
    
    return _mapToDomainRecipe(dbRecipe);
  }

  @override
  Future<void> deleteRecipe(String id) async {
    await _database.deleteRecipe(id);
  }

  @override
  Future<List<domain.Recipe>> getFavoriteRecipes() async {
    final dbRecipes = await _database.getFavoriteRecipes();
    final List<domain.Recipe> recipes = [];
    
    for (final dbRecipe in dbRecipes) {
      recipes.add(await _mapToDomainRecipe(dbRecipe));
    }
    
    return recipes;
  }

  @override
  Future<domain.Recipe> setFavorite(String id, bool isFavorite) async {
    await _database.setRecipeFavorite(id, isFavorite);
    
    final dbRecipe = await _database.getRecipeByUuid(id);
    if (dbRecipe == null) {
      throw Exception('Recipe not found');
    }
    
    return _mapToDomainRecipe(dbRecipe);
  }

  @override
  Future<List<domain.Recipe>> getRecipesByTag(String tag) async {
    final dbRecipes = await _database.getRecipesByTag(tag);
    final List<domain.Recipe> recipes = [];
    
    for (final dbRecipe in dbRecipes) {
      recipes.add(await _mapToDomainRecipe(dbRecipe));
    }
    
    return recipes;
  }

  @override
  Future<List<domain.Recipe>> searchRecipes(String query) async {
    final String likeQuery = '%$query%';
    
    final queryResult = await (_database.select(_database.recipes)
      ..where((r) => 
          r.name.like(likeQuery) | 
          r.altName.like(likeQuery) |
          r.about.like(likeQuery) |
          r.notes.like(likeQuery)
      )
    ).get();
    
    final List<domain.Recipe> recipes = [];
    
    for (final dbRecipe in queryResult) {
      recipes.add(await _mapToDomainRecipe(dbRecipe));
    }
    
    return recipes;
  }
}