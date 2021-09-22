import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatelessWidget {
  final double height;
  final Color color;
  final String title;
  final String subtitle;
  final AnimeTypes type;

  Category({
    this.height,
    this.color,
    this.title,
    this.subtitle,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MainAnimeCubit>(context).fetchAnime(
          type: type,
          subtype: getSybtypeByName(name: title),
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 20),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
