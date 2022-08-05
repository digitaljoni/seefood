import 'package:flutter/material.dart';
import 'package:recipe_api/recipe_api.dart';
import 'package:seefood/config/config.dart';
import 'package:seefood/home/cubit/cubit.dart';

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
    required this.text,
    super.key,
  });

  final FilterType groupValue;
  final FilterType value;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final menuColor = groupValue != value ? null : AppTheme.secondaryColor;

    return GestureDetector(
      onTap: () => context.read<HomeCubit>().setFilter(value),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: menuColor ?? Colors.transparent,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
              color: menuColor,
            ),
            Text(
              text,
              style: TextStyle(
                color: menuColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
