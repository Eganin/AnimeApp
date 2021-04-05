import 'package:flutter/cupertino.dart';

abstract class UserState {}

class DataEmptyState extends UserState {}

class DataLoadingState extends UserState {}

class DataLoadedState extends UserState{
  List<dynamic> loadedData;
  DataLoadedState({@required this.loadedData}) : assert(loadedData != null);
}

class DataErrorState extends UserState{}