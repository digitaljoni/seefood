import 'package:flutter/material.dart';
import 'package:seefood/config/config.dart';

class RecipeTags extends StatelessWidget {
  const RecipeTags({required this.tags, super.key});

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 4,
        runSpacing: 4,
        children: tags
            .map<RecipeTag>(
              (String tag) => RecipeTag(name: tag),
            )
            .toList(),
      ),
    );
  }
}

class RecipeTag extends StatelessWidget {
  const RecipeTag({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.tagColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      // margin: EdgeInsets.all(2),
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
