import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const ImageAsset({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: BoxFit.fitWidth,
    );
  }
}
