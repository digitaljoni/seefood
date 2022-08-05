import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/config/config.dart';
import 'package:seefood/home/home.dart';
import 'package:seefood/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.recipeRepository,
    super.key,
  });

  final RecipeRepository recipeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<RecipeRepository>.value(
      value: recipeRepository,
      child: MaterialApp(
        theme: AppTheme.defaultThemeData,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomePage(),
      ),
    );
  }
}
