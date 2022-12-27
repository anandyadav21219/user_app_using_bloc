import 'package:blocexample/bloc/api_repository.dart';
import 'package:blocexample/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: RepositoryProvider(
          create: (BuildContext context) => ApiRepository(),
          child: const HomePage(title: 'Flutter Demo Home Page')),
    );
  }
}
