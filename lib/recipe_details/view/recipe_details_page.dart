import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/recipe_details/cubit/cubit.dart';
import 'package:seefood/recipe_details/widgets/recipe_details_body.dart';

/// {@template recipe_details_page}
/// A description for RecipeDetailsPage
/// {@endtemplate}
class RecipeDetailsPage extends StatelessWidget {
  /// {@macro recipe_details_page}
  const RecipeDetailsPage({super.key});

  /// The static route for RecipeDetailsPage
  static Route<dynamic> route({
    required Recipe initalRecipe,
  }) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => RecipeDetailsCubit(
          initalRecipe: initalRecipe,
          recipeRepository: context.read<RecipeRepository>(),
        )..getRecipe(),
        child: const RecipeDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: const RecipeDetailsView(),
    );
  }
}

/// {@template recipe_details_view}
/// Displays the Body of RecipeDetailsView
/// {@endtemplate}
class RecipeDetailsView extends StatelessWidget {
  /// {@macro recipe_details_view}
  const RecipeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeDetailsBody();
  }
}
