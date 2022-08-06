import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/recipe_details/cubit/cubit.dart';
import 'package:seefood/recipe_details/recipe_details.dart';

/// {@template recipe_details_body}
/// Body of the RecipeDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class RecipeDetailsBody extends StatelessWidget {
  /// {@macro recipe_details_body}
  const RecipeDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeDetailsCubit, RecipeDetailsState>(
      builder: (context, state) {
        final recipe = state.recipe;

        if (state.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImage(
                id: recipe.id,
                imageUrl: recipe.imageUrl,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  recipe.name,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Loading(),
                ),
              ),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeImage(
              id: recipe.id,
              imageUrl: recipe.imageUrl,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Text(
                recipe.name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            if (recipe.hasNoTags)
              const RecipeTags(tags: ['No Tags'])
            else
              RecipeTags(tags: recipe.tags),
            const Expanded(
              child: RecipeDetailsTab(),
            ),
          ],
        );
      },
    );
  }
}
