import 'package:flutter/material.dart';

class Character extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String role;

  Character({this.name, this.imageUrl, this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10,right: 10),
      child: Column(
        children: [
          Image.network(
            imageUrl,
            height: 180,
          ),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Text(
              role,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
