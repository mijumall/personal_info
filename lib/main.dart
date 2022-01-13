import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './home/home_screen.dart';
import './home/add_screen.dart';
import './home/person/person_detail_screen.dart';
import './home/person/edit_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Info',
      theme: ThemeData.dark(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        AddScreen.routeName: (_) => const AddScreen(),
        PersonDetailScreen.routeName: (_) => const PersonDetailScreen(),
        EditScreen.routeName: (_) => const EditScreen(),
      },
    );
  }
}
