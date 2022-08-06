import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';
import 'package:seefood/config/app_theme.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    required this.id,
    required this.imageUrl,
    super.key,
  });

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height / 3;
    return Stack(
      children: [
        Hero(
          tag: 'recipe$id',
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                const Loading(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.white12,
          height: imageHeight,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '#$id',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 70,
                height: 0.01,
                color: AppTheme.mobileBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
