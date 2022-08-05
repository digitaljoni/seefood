part of 'recipe_list_cubit.dart';

enum RecipeListStatus { initial, loading, success, failure }

/// {@template recipe_list}
/// RecipeListState description
/// {@endtemplate}
class RecipeListState extends Equatable {
  /// {@macro recipe_list}
  const RecipeListState({
    this.recipes = Recipes.empty,
    this.status = RecipeListStatus.initial,
  });

  /// [Recipe] with list of filters
  final Recipes recipes;

  /// Status of state
  final RecipeListStatus status;

  @override
  List<Object> get props => [
        recipes,
        status,
      ];

  /// Creates a copy of the current RecipeListState with property changes
  RecipeListState copyWith({
    Recipes? recipes,
    RecipeListStatus? status,
  }) {
    return RecipeListState(
      recipes: recipes ?? this.recipes,
      status: status ?? this.status,
    );
  }

  bool get isLoading =>
      status == RecipeListStatus.initial || status == RecipeListStatus.loading;

  bool get isSuccess => status == RecipeListStatus.success;

  bool get isFailure => status == RecipeListStatus.failure;
}
