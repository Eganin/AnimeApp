import 'package:anime_app/data/models/top.dart';
import 'package:anime_app/ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Top post;

  @override
  _DetailPageState createState() => _DetailPageState();

  DetailPage({this.post});
}

class _DetailPageState extends State<DetailPage> {
  Top post;

  _DetailPageState({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
    );
  }
}
