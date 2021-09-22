import 'package:flutter/material.dart';

class ImageAnime extends StatelessWidget {
  final bool closeTopContainer;
  final double categoryHeight;
  final Size size;
  final String imageUrl;

  const ImageAnime({
    this.closeTopContainer,
    this.categoryHeight,
    this.size,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: closeTopContainer ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: size.width,
        alignment: Alignment.topCenter,
        height: closeTopContainer ? 0 : categoryHeight,
        child: Image.network(
          imageUrl,
          filterQuality: FilterQuality.high,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
