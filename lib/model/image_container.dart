import "package:flutter/material.dart";

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, required this.asset,this.height=250,this.width=250});
  final String asset;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(asset),
    );
  }
}

