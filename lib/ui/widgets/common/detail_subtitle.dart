import 'package:flutter/material.dart';

Text detailSubtitle({
  String text,
  double size,
  Color color = Colors.black87,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
  );
}
