import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_repository/recipe_repository.dart';
import 'package:seefood/app/app.dart';
import 'package:seefood/home/view/home_page.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        App(
          recipeRepository: RecipeRepository(),
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
