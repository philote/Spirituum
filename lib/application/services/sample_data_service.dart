import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spirituum/domain/models/recipe.dart';
import 'package:spirituum/domain/repositories/recipe_repository.dart';
import 'package:spirituum/data/repositories/recipe_repository_impl.dart';

part 'sample_data_service.g.dart';

/// Service for providing sample recipe data
///
/// This service loads sample cocktail recipes into the repository
/// for demonstration and testing purposes.
class SampleDataService {
  final RecipeRepository _recipeRepository;

  SampleDataService(this._recipeRepository);

  /// Load sample recipes into the repository
  Future<void> loadSampleData() async {
    for (final recipe in _sampleRecipes) {
      await _recipeRepository.saveRecipe(recipe);
    }
  }

  /// Sample cocktail recipes
  List<Recipe> get _sampleRecipes => [
    Recipe(
      id: '1',
      name: 'Old Fashioned',
      about: 'The Old Fashioned is a classic cocktail that has been served since the mid-1800s. It\'s a simple but sophisticated combination of bourbon, bitters, sugar, and water.',
      tags: [Tag(value: 'bourbon'), Tag(value: 'classic'), Tag(value: 'spirit-forward')],
      instructions: [
        const Instruction(step: 1, value: 'Add sugar and bitters to a rocks glass.'),
        const Instruction(step: 2, value: 'Add a splash of water and stir until the sugar is dissolved.'),
        const Instruction(step: 3, value: 'Fill the glass with ice cubes.'),
        const Instruction(step: 4, value: 'Add bourbon and stir gently.'),
        const Instruction(step: 5, value: 'Garnish with an orange twist and a cocktail cherry.'),
      ],
      alcoholic: true,
      glassware: 'Rocks glass',
      garnish: 'Orange twist and cocktail cherry',
      ingredients: [
        Ingredient(
          name: 'Bourbon whiskey',
          amount: Amount(value: 2.0, label: 'oz'),
        ),
        Ingredient(
          name: 'Sugar cube',
          amount: Amount(value: 1.0, label: 'cube'),
        ),
        Ingredient(
          name: 'Angostura bitters',
          amount: Amount(value: 2.0, label: 'dashes'),
        ),
        Ingredient(
          name: 'Water',
          amount: Amount(value: 1.0, label: 'splash'),
        ),
      ],
      createdAt: DateTime.now(),
    ),
    
    Recipe(
      id: '2',
      name: 'Mojito',
      about: 'The Mojito is a traditional Cuban highball. The cocktail often consists of five ingredients: white rum, sugar, lime juice, soda water, and mint.',
      tags: [Tag(value: 'rum'), Tag(value: 'refreshing'), Tag(value: 'summer')],
      instructions: [
        const Instruction(step: 1, value: 'Place mint leaves and lime wedges in a glass.'),
        const Instruction(step: 2, value: 'Add sugar and muddle gently.'),
        const Instruction(step: 3, value: 'Add crushed ice.'),
        const Instruction(step: 4, value: 'Pour in rum and top with soda water.'),
        const Instruction(step: 5, value: 'Stir gently and garnish with mint sprig.'),
      ],
      alcoholic: true,
      glassware: 'Collins glass',
      garnish: 'Mint sprig',
      ingredients: [
        Ingredient(
          name: 'White rum',
          amount: Amount(value: 2.0, label: 'oz'),
        ),
        Ingredient(
          name: 'Fresh lime',
          amount: Amount(value: 1.0, label: 'whole'),
          notes: 'Cut into wedges',
        ),
        Ingredient(
          name: 'Sugar',
          amount: Amount(value: 2.0, label: 'tsp'),
        ),
        Ingredient(
          name: 'Mint leaves',
          amount: Amount(value: 8.0, label: 'leaves'),
        ),
        Ingredient(
          name: 'Soda water',
          amount: Amount(value: 2.0, label: 'oz'),
        ),
      ],
      createdAt: DateTime.now(),
    ),

    Recipe(
      id: '3',
      name: 'Margarita',
      about: 'The Margarita is a Mexican cocktail consisting of tequila, orange liqueur, and lime juice often served with salt on the rim of the glass.',
      tags: [Tag(value: 'tequila'), Tag(value: 'citrus'), Tag(value: 'mexican')],
      instructions: [
        const Instruction(step: 1, value: 'Rub the rim of a glass with lime wedge and dip in salt.'),
        const Instruction(step: 2, value: 'Fill a shaker with ice.'),
        const Instruction(step: 3, value: 'Add tequila, lime juice, and triple sec.'),
        const Instruction(step: 4, value: 'Shake well and strain into the prepared glass.'),
        const Instruction(step: 5, value: 'Garnish with a lime wheel.'),
      ],
      alcoholic: true,
      glassware: 'Margarita glass',
      garnish: 'Salt rim and lime wheel',
      ingredients: [
        Ingredient(
          name: 'Tequila',
          amount: Amount(value: 2.0, label: 'oz'),
        ),
        Ingredient(
          name: 'Triple sec',
          amount: Amount(value: 1.0, label: 'oz'),
        ),
        Ingredient(
          name: 'Fresh lime juice',
          amount: Amount(value: 1.0, label: 'oz'),
        ),
        Ingredient(
          name: 'Salt',
          amount: Amount(value: 1.0, label: 'pinch'),
          notes: 'For rim',
        ),
      ],
      createdAt: DateTime.now(),
    ),
  ];
}

/// Provider for SampleDataService
@riverpod
SampleDataService sampleDataService(SampleDataServiceRef ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return SampleDataService(repository);
}