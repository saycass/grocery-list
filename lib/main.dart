import 'package:flutter/material.dart';
import 'package:grocery_list/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Grocery List",
      theme: ThemeData (
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData (
          color: Colors.purple,
        )
      ),
      home:  HomeScreen(),
    );
  }
}
