import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';
part 'recipe_list_state.dart';

class RecipeListCubit extends Cubit<RecipeListState> {
  RecipeListCubit({
    required this.filter,
    required this.recipeRepository,
  }) : super(const RecipeListState());

  final Filter filter;
  final RecipeRepository recipeRepository;

  /// A description for yourCustomFunction
  Future<void> getRecipes() async {
    emit(
      state.copyWith(
        status: RecipeListStatus.loading,
      ),
    );

    try {
      final recipes = await recipeRepository.fetchRecipesByFilter(
        query: filter.name,
        filterType: filter.filterType,
      );

      emit(
        state.copyWith(
          recipes: recipes,
          status: RecipeListStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: RecipeListStatus.failure,
        ),
      );
    }
  }
}
