import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:seefood/common/common.dart';

class RecipeGridCell extends StatelessWidget {
  const RecipeGridCell({
    required this.recipe,
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Stack(
        children: [
          Thumbnail(
            id: recipe.id,
            imageUrl: recipe.imageUrl,
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              recipe.name,
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.9),
                    blurRadius: 8,
                  ),
                  Shadow(
                    color: Colors.black.withOpacity(0.9),
                    blurRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
