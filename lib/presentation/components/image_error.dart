import 'package:flutter/material.dart';

class ImageFailed extends StatelessWidget {
  final double aspectRatio;
  final double radius;
  const ImageFailed({
    super.key,
    required this.aspectRatio,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      key: const Key('image_failed'),
      aspectRatio: aspectRatio,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.white38,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 70),
            Text('No Image \n Available'),
          ],
        ),
      ),
    );
  }
}
