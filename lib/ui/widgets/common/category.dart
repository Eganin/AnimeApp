import 'package:anime_app/data/cubit/main_anime_cubit.dart';
import 'package:anime_app/data/services/api/anime_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Category extends StatefulWidget {
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
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final isPlatformDark =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<MainAnimeCubit>(context).fetchAnime(
          type: widget.type,
          subtype: getSybtypeByName(name: widget.title),
        );
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 20),
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.color,
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
                widget.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.headline4.copyWith(
                      fontWeight: FontWeight.normal,
                  color: isPlatformDark ? Colors.white24 : Colors.black87,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
