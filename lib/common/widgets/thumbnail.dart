import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:seefood/common/common.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({
    required this.id,
    required this.imageUrl,
    super.key,
  });

  final String id;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Hero(
        tag: 'recipe$id',
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const Loading(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
