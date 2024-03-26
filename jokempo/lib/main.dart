import 'package:flutter/material.dart';
import 'package:jokempo/pages/home.dart';

void main() {
  final ThemeData thema = ThemeData();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData().copyWith(
        colorScheme: thema.colorScheme.copyWith(
          primary: Colors.amber,
        ),
      ),
    ),
  );
}
