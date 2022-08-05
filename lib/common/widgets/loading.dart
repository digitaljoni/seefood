import 'package:flutter/material.dart';
import 'package:seefood/config/config.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          AppTheme.primaryColor,
        ),
      ),
    );
  }
}
