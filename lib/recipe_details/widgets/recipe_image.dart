import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';

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
    return Hero(
      tag: 'recipe$id',
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            const Loading(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
