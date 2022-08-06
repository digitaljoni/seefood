part of 'recipe_details_cubit.dart';

enum RecipeDetailsStatus { initial, loading, success, failure }

/// {@template recipe_details}
/// RecipeDetailsState description
/// {@endtemplate}
class RecipeDetailsState extends Equatable {
  /// {@macro recipe_details}
  const RecipeDetailsState({
    this.recipe = Recipe.empty,
    this.status = RecipeDetailsStatus.initial,
  });

  /// [Recipe] with list of recipe
  final Recipe recipe;

  /// Status of state
  final RecipeDetailsStatus status;

  @override
  List<Object> get props => [
        recipe,
        status,
      ];

  /// Creates a copy of the current RecipeDetailsState with property changes
  RecipeDetailsState copyWith({Recipe? recipe, RecipeDetailsStatus? status}) {
    return RecipeDetailsState(
      recipe: recipe ?? this.recipe,
      status: status ?? this.status,
    );
  }

  bool get isLoading =>
      status == RecipeDetailsStatus.initial ||
      status == RecipeDetailsStatus.loading;

  bool get isSuccess => status == RecipeDetailsStatus.success;

  bool get isFailure => status == RecipeDetailsStatus.failure;
}
