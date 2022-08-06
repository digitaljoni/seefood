import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/recipe_list/cubit/cubit.dart';
import 'package:seefood/recipe_list/widgets/recipe_list_body.dart';

/// {@template recipe_list_page}
/// A description for RecipeListPage
/// {@endtemplate}
class RecipeListPage extends StatelessWidget {
  /// {@macro recipe_list_page}
  const RecipeListPage({super.key});

  /// The static route for RecipeListPage
  static Route<dynamic> route({
    required Filter filter,
  }) {
    return MaterialPageRoute(
      builder: (context) => RepositoryProvider<Filter>.value(
        value: filter,
        child: const RecipeListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filter = context.read<Filter>();
    return BlocProvider(
      create: (context) => RecipeListCubit(
        filter: filter,
        recipeRepository: context.read<RecipeRepository>(),
      )..getRecipes(),
      child: Scaffold(
        appBar: AppBar(title: Text('${filter.name} Recipe')),
        body: const RecipeListView(),
      ),
    );
  }
}

/// {@template recipe_list_view}
/// Displays the Body of RecipeListView
/// {@endtemplate}
class RecipeListView extends StatelessWidget {
  /// {@macro recipe_list_view}
  const RecipeListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeListBody();
  }
}
