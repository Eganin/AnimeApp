import 'package:flutter/material.dart';

Widget checkNullWidget({bool condition , Widget widget}){
  if(condition){
    return widget;
  }else{
    return Container();
  }
}