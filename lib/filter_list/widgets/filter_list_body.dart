import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/filter_list/cubit/cubit.dart';
import 'package:seefood/recipe_list/recipe_list.dart';

/// {@template filter_list_body}
/// Body of the FilterListPage.
///
/// Add what it does
/// {@endtemplate}
class FilterListBody extends StatelessWidget {
  /// {@macro filter_list_body}
  const FilterListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterListCubit, FilterListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: Loading(),
          );
        }

        final filters = state.filters;
        final filtersList = filters.filters;

        return ListView.builder(
          itemCount: filters.count,
          itemBuilder: (context, index) {
            final filter = filtersList[index];
            return ListTile(
              onTap: () => Navigator.of(context).push(
                RecipeListPage.route(filter: filter),
              ),
              title: Text(
                filter.name,
                style: Theme.of(context).textTheme.headline2,
              ),
            );
          },
        );
      },
    );
  }
}
