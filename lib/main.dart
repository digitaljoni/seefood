import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/app/app.dart';
import 'package:seefood/bootstrap.dart';

void main() {
  final recipeRepository = RecipeRepository();

  bootstrap(
    () => App(
      recipeRepository: recipeRepository,
    ),
  );
}
