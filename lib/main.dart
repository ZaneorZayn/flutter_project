import 'package:flutter/material.dart';
import 'package:new_project/appbar.dart';
import 'package:new_project/core/text_theme.dart';
import 'package:new_project/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink[300]!),
        textTheme: ResponsiveTextTheme.getTextTheme(context),
      ),
      home:HomeScreen(),

    );
}
}