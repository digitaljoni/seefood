import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit({
    required this.id,
    required this.recipeRepository,
  }) : super(const RecipeDetailsState());

  final String id;
  final RecipeRepository recipeRepository;

  Future<void> getRecipe() async {
    emit(
      state.copyWith(
        status: RecipeDetailsStatus.loading,
      ),
    );

    try {
      final recipe = await recipeRepository.fetchRecipeById(id: id);

      emit(
        state.copyWith(
          recipe: recipe,
          status: RecipeDetailsStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          status: RecipeDetailsStatus.failure,
        ),
      );
    }
  }
}
