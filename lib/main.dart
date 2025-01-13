import 'package:flutter/material.dart';
import 'package:foodies/pages/intro_pages/intro_screens.dart';

void main() {
  runApp(MaterialApp(
    title: 'Foodies',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEFEFF)),
      useMaterial3: true,
    ),
    home: const IntroScreens(),
    debugShowCheckedModeBanner: false,
  ));
}
