import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:seefood/home/cubit/cubit.dart';
import 'package:seefood/home/home.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilterType =
        context.select((HomeCubit cubit) => cubit.state.filterType);

    return Scaffold(
      body: TestWidget(filterType: selectedFilterType),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeTabButton(
              groupValue: selectedFilterType,
              value: FilterType.area,
              icon: Icons.location_city,
              text: FilterType.area.name,
            ),
            HomeTabButton(
              groupValue: selectedFilterType,
              value: FilterType.category,
              icon: Icons.category,
              text: FilterType.category.name,
            ),
            HomeTabButton(
              groupValue: selectedFilterType,
              value: FilterType.ingredient,
              icon: Icons.set_meal,
              text: FilterType.ingredient.name,
            ),
          ],
        ),
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
    required this.filterType,
  });

  final FilterType filterType;
  static const colorMap = {
    FilterType.area: Colors.red,
    FilterType.category: Colors.blue,
    FilterType.ingredient: Colors.orange,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: colorMap[filterType],
      child: Center(
        child: Text(
          filterType.name,
        ),
      ),
    );
  }
}
