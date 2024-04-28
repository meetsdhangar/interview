import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Screen/albumScreen.dart';
import 'package:interview/Screen/commentsScreen.dart';
import 'package:interview/Screen/homeScreen.dart';
import 'package:interview/Screen/photosScreen.dart';
import 'package:interview/Screen/todoScreen.dart';
import 'package:interview/Screen/userScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserScreen(),
    );
  }
}
