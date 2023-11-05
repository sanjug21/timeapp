import 'package:flutter/material.dart';
import 'package:timeapp/pages/home.dart';
import 'package:timeapp/pages/location.dart';
import 'package:timeapp/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/': (context)=>const Loading(),
      '/home': (context)=>const Home(),
      '/location':(context)=>const ChooseLocation(),

    },
  ));
}