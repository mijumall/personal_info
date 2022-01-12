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
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
            title: const Text('ID'),
            subtitle: Text(displayData['_id']),
          ),

          // name
          ListTile(
            title: const Text('Name'),
            subtitle: Text(displayData['name']),
          ),

          // age
          ListTile(
            title: const Text('Age'),
            subtitle: Text(displayData['age'].toString()),
          ),

          // gender
          ListTile(
            title: const Text('Gender'),
            subtitle: Text(displayData['gender']),
          ),

          // country
          ListTile(
            title: const Text('Country'),
            subtitle: Text(displayData['country']),
          ),

          // description
          ListTile(
            title: const Text('Description'),
            subtitle: Text(displayData['description']),
          ),

          // Buffer for further scrolling
          const SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
