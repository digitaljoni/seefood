import 'package:mem_cache/mem_cache.dart';
import 'package:recipe_api/recipe_api.dart';

/// {@template recipe_repository}
/// Recipe Repository
/// {@endtemplate}
class RecipeRepository {
  /// {@macro recipe_repository}
  RecipeRepository({
    MemCache? cache,
    RecipeApi? recipeApi,
  })  : _cache = cache ?? MemCache(),
        _recipeApi = recipeApi ?? RecipeApi();

  final RecipeApi _recipeApi;
  final MemCache _cache;

  final _keyCategories = '_categories';
  final _keyRecipesPrefix = '_recipes_';
  final _keyRecipeDetailsPrefix = '_recipe_';

  final _keyFilters = '_filters_';

  /// Fetch [Categories] from cache or RecipeApi
  Future<Categories> fetchCategories() async {
    final cachedCategories = _cache.read<Categories>(key: _keyCategories);

    if (cachedCategories != null) {
      return cachedCategories;
    }

    try {
      final categories = await _recipeApi.fetchCategories();
      _cache.write<Categories>(key: _keyCategories, value: categories);
      return categories;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch [Filters] from cache or RecipeApi
  Future<Filters> fetchFilters(FilterType filterType) async {
    final _key = '$_keyFilters${filterType.queryField}';
    final cachedFilters = _cache.read<Filters>(key: _key);

    if (cachedFilters != null) {
      return cachedFilters;
    }

    try {
      final filters = await _recipeApi.fetchFilters(filterType);
      _cache.write<Filters>(key: _key, value: filters);
      return filters;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch [Recipes] from API based on Filter
  Future<Recipes> fetchRecipesByFilter({
    required String query,
    required FilterType filterType,
  }) async {
    final key = '$_keyRecipesPrefix$query';

    final cachedRecipes = _cache.read<Recipes>(key: key);

    if (cachedRecipes != null) {
      return cachedRecipes;
    }

    try {
      final recipes = await _recipeApi.fetchRecipesByFilter(
        query: query,
        filterType: filterType,
      );

      _cache.write<Recipes>(key: key, value: recipes);

      return recipes;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch [Recipe] from API
  Future<Recipe> fetchRecipeById({required String id}) async {
    final key = '$_keyRecipeDetailsPrefix$id';

    final cachedRecipeDetails = _cache.read<Recipe>(key: key);

    if (cachedRecipeDetails != null) {
      return cachedRecipeDetails;
    }

    try {
      final recipeDetails = await _recipeApi.fetchRecipeById(id: id);

      _cache.write<Recipe>(key: key, value: recipeDetails);

      return recipeDetails;
    } catch (e) {
      rethrow;
    }
  }
}
