import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/config/config.dart';
import 'package:seefood/recipe_details/cubit/cubit.dart';
import 'package:seefood/recipe_details/recipe_details.dart';

class RecipeDetailsTab extends StatefulWidget {
  const RecipeDetailsTab({super.key});

  @override
  State<RecipeDetailsTab> createState() => _RecipeDetailsTabState();
}

class _RecipeDetailsTabState extends State<RecipeDetailsTab> {
  late int index;

  @override
  void initState() {
    index = 0;

    super.initState();
  }

  void onTap(int value) {
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white30,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TabMenuButton(
                groupValue: index,
                value: 0,
                text: 'Instructions',
                onTap: () {
                  onTap(0);
                },
              ),
              _TabMenuButton(
                groupValue: index,
                value: 1,
                text: 'Ingredients',
                onTap: () {
                  onTap(1);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: index,
            children: const [
              _Instructions(),
              _Ingredients(),
            ],
          ),
        ),
      ],
    );
  }
}

class _TabMenuButton extends StatelessWidget {
  const _TabMenuButton({
    required this.groupValue,
    required this.value,
    required this.text,
    required this.onTap,
  });

  final int groupValue;
  final int value;

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final menuColor = groupValue != value ? null : AppTheme.secondaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: menuColor ?? Colors.transparent,
            ),
          ),
        ),
        child: Text(
          text.titleCase(),
          style: TextStyle(
            color: menuColor,
          ),
        ),
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions();

  @override
  Widget build(BuildContext context) {
    final recipe = context.read<RecipeDetailsCubit>().state.recipe;

    return RecipeChecklist(
      checklist: recipe.instructions,
    );
  }
}

class _Ingredients extends StatelessWidget {
  const _Ingredients();

  @override
  Widget build(BuildContext context) {
    final recipe = context.read<RecipeDetailsCubit>().state.recipe;

    return RecipeChecklist(
      checklist: recipe.ingredientsToString,
    );
  }
}
