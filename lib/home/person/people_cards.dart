import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './person_provider.dart';

import './person_card.dart';

final personProvider = ChangeNotifierProvider((_) => PersonProvider());

class PeopleCards extends ConsumerWidget {
  const PeopleCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personWatcher = ref.watch(personProvider);
    return ListView.builder(
      itemCount: personWatcher.data.length,
      itemBuilder: (_, index) {
        return PersonCard(
          imageUrl: personWatcher.data[0]['imageUrl'],
          name: personWatcher.data[0]['name'],
          description: personWatcher.data[0]['description'],
        );
      },
    );
  }
}
