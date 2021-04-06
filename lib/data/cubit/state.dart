import 'file:///C:/Users/egorz/AndroidStudioProjects/anime_app/lib/data/models/anime/list/top.dart';
import 'package:flutter/cupertino.dart';

abstract class DataState {}

class DataEmptyState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState{}

class DataErrorState extends DataState{}