import 'package:flutter/material.dart';

import './add_screen.dart';
import './person/people_cards.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOME')),
      body: const PeopleCards(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
