import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageLoading extends StatelessWidget {
  final double aspectRatio;
  final double radius;
  const ImageLoading({
    super.key,
    required this.aspectRatio,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      key: const Key('image_loading'),
      baseColor: Colors.white60,
      highlightColor: Colors.white38,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
