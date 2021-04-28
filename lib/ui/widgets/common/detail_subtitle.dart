import 'package:flutter/material.dart';

Text detailSubtitle({
  String text,
  double size,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
  );
}
