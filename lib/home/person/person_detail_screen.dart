import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './person_provider.dart';

final personProvider = ChangeNotifierProvider((_) => PersonProvider());

class PersonDetailScreen extends ConsumerWidget {
  static const routeName = '/person_detail_screen';

  const PersonDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personWatcher = ref.watch(personProvider);
    final index = ModalRoute.of(context)!.settings.arguments as int;

    final displayData = personWatcher.data[index];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(displayData['imageUrl']),
            ),
          ),

          // _id
          ListTile(
            title: const Text('Name'),
            subtitle: Text(displayData['name']),
          ),
        ],
      ),
    );
  }
}
