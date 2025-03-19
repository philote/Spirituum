import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

/// Table for storing recipes
class Recipes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get altName => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  TextColumn get about => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get alcoholic => boolean().withDefault(const Constant(false))();
  TextColumn get glassware => text().nullable()();
  TextColumn get garnish => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  TextColumn get userId => text().nullable()();
  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
}

/// Table for storing tags
class Tags extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get value => text().unique()();
}

/// Junction table for recipe-tag associations
class RecipeTags extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId =>
      integer().references(Tags, #id, onDelete: KeyAction.cascade)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {recipeId, tagId},
  ];
}

/// Table for storing instructions
class Instructions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  TextColumn get value => text()();
  IntColumn get step => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {recipeId, step},
  ];
}

/// Table for storing ingredients
class Ingredients extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(Recipes, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  RealColumn get amountValue => real()();
  TextColumn get amountLabel => text()();
  TextColumn get notes => text().nullable()();
}

/// Database class for the application
@DriftDatabase(tables: [Recipes, Tags, RecipeTags, Instructions, Ingredients])
class AppDatabase extends _$AppDatabase {
  /// Creates a database instance
  AppDatabase() : super(_openConnection());

  /// Creates a database instance with a custom QueryExecutor
  AppDatabase.connect(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) {
      return m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // Handle future schema migrations here
      if (from < 2) {
        // If we ever need to migrate to version 2
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');

      // Enable full-text search if database is being created
      if (details.wasCreated) {
        // Create FTS tables for full-text search on recipes if needed
      }

      // Verify database integrity and perform any necessary checks
    },
  );

  /// Gets a list of all recipes
  Future<List<Recipe>> getAllRecipes() => select(recipes).get();

  /// Gets a recipe by its UUID
  Future<Recipe?> getRecipeByUuid(String uuid) =>
      (select(recipes)..where((r) => r.uuid.equals(uuid))).getSingleOrNull();

  /// Gets a list of favorite recipes
  Future<List<Recipe>> getFavoriteRecipes() =>
      (select(recipes)..where((r) => r.isFavorite.equals(true))).get();

  /// Sets a recipe's favorite status
  Future<int> setRecipeFavorite(String uuid, bool isFavorite) =>
      (update(recipes)..where(
        (r) => r.uuid.equals(uuid),
      )).write(RecipesCompanion(isFavorite: Value(isFavorite)));

  /// Saves a recipe to the database
  Future<int> saveRecipe(Insertable<Recipe> recipe) =>
      into(recipes).insert(recipe, mode: InsertMode.insertOrReplace);

  /// Deletes a recipe by its UUID
  Future<int> deleteRecipe(String uuid) =>
      (delete(recipes)..where((r) => r.uuid.equals(uuid))).go();

  /// Gets all tags for a recipe
  Future<List<Tag>> getTagsForRecipe(int recipeId) {
    final query = select(tags).join([
      innerJoin(
        recipeTags,
        recipeTags.tagId.equalsExp(tags.id),
        useColumns: false,
      ),
    ])..where(recipeTags.recipeId.equals(recipeId));

    return query.map((row) => row.readTable(tags)).get();
  }

  /// Gets all instructions for a recipe
  Future<List<Instruction>> getInstructionsForRecipe(int recipeId) =>
      (select(instructions)
            ..where((i) => i.recipeId.equals(recipeId))
            ..orderBy([(i) => OrderingTerm.asc(i.step)]))
          .get();

  /// Gets all ingredients for a recipe
  Future<List<Ingredient>> getIngredientsForRecipe(int recipeId) =>
      (select(ingredients)..where((i) => i.recipeId.equals(recipeId))).get();

  /// Gets all recipes with a specific tag
  Future<List<Recipe>> getRecipesByTag(String tag) async {
    // First get the tag ID
    final tagQuery =
        await (select(tags)
          ..where((t) => t.value.equals(tag))).getSingleOrNull();
    if (tagQuery == null) {
      return [];
    }

    // Then find recipes with this tag
    final recipeTagQuery = select(recipes).join([
      innerJoin(recipeTags, recipeTags.recipeId.equalsExp(recipes.id)),
    ])..where(recipeTags.tagId.equals(tagQuery.id));

    return recipeTagQuery.map((row) => row.readTable(recipes)).get();
  }

  /// Count the number of recipes in the database
  Future<int> countRecipes() async {
    final count =
        await customSelect(
          'SELECT COUNT(*) AS count FROM recipes',
          readsFrom: {recipes},
        ).getSingle();
    return count.read<int>('count');
  }

  /// Search recipes by query string
  Future<List<Recipe>> searchRecipes(String query) {
    final likeQuery = '%$query%';
    return (select(recipes)..where(
      (r) =>
          r.name.like(likeQuery) |
          r.altName.like(likeQuery) |
          r.about.like(likeQuery) |
          r.notes.like(likeQuery),
    )).get();
  }
}

/// Opens a database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // First, try to initialize sqlite3 with the custom binaries
    try {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      // Initialize SQLite - this ensures proper initialization on all platforms
      sqlite3.open(':memory:').dispose();
    } catch (e) {
      print('Failed to initialize sqlite3: $e');
      // Continue anyway, might work with the system sqlite
    }

    // Get the database location
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'spirituum.sqlite'));

    // Make sure the directory exists
    if (!await file.parent.exists()) {
      await file.parent.create(recursive: true);
    }

    // Open the database
    return NativeDatabase(
      file,
      // Set WAL mode for better concurrency and performance
      setup: (db) => db.execute('PRAGMA journal_mode=WAL;'),
    );
  });
}
