import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/recipe_list/cubit/cubit.dart';

/// {@template recipe_list_body}
/// Body of the RecipeListPage.
///
/// Add what it does
/// {@endtemplate}
class RecipeListBody extends StatelessWidget {
  /// {@macro recipe_list_body}
  const RecipeListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeListCubit, RecipeListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: Loading(),
          );
        }

        final recipes = state.recipes;
        final recipeList = recipes.recipes;

        return GridView.count(
          crossAxisCount: 3,
          children: recipeList
              .map((recipe) => RecipeGridCell(recipe: recipe))
              .toList(),
        );
      },
    );
  }
}
