import 'package:anime_app/data/models/top.dart';
import 'package:flutter/cupertino.dart';

abstract class DataState {}

class DataEmptyState extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState{
  List<Top> loadedData;
  DataLoadedState({@required this.loadedData}) : assert(loadedData != null);
}

class DataErrorState extends DataState{}