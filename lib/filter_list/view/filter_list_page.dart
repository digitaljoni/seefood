import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/filter_list/cubit/cubit.dart';
import 'package:seefood/filter_list/widgets/filter_list_body.dart';

/// {@template filter_list_page}
/// A description for FilterListPage
/// {@endtemplate}
class FilterListPage extends StatelessWidget {
  /// {@macro filter_list_page}
  const FilterListPage({
    required this.filterType,
    super.key,
  });

  final FilterType filterType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilterListCubit>(
      create: (context) => FilterListCubit(
        filterType: filterType,
        recipeRepository: context.read<RecipeRepository>(),
      )..getFilters(),
      child: Scaffold(
        appBar: AppBar(title: Text(filterType.name.titleCase())),
        body: const FilterListView(),
      ),
    );
  }
}

/// {@template filter_list_view}
/// Displays the Body of FilterListView
/// {@endtemplate}
class FilterListView extends StatelessWidget {
  /// {@macro filter_list_view}
  const FilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FilterListBody();
  }
}
