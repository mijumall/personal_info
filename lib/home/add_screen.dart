import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  static const routeName = 'AddScreen';

  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _countryController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _gender = 'Female';

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _countryController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new person'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(label: Text('Email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!value.contains('@')) {
                    return 'Invalid email';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            // Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            // Age
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(label: Text('Age')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  } else if (int.parse(value) < 0) {
                    return 'Age must be a positive number';
                  }
                  return null;
                },
              ),
            ),

            // Gender
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    DropdownButton(
                      value: _gender,
                      items: ['Female', 'Male', 'Others']
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Country
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _countryController,
                decoration: const InputDecoration(label: Text('Country')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(label: Text('Description')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            // Image Url
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(label: Text('Image URL')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the URL of the image';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Implement HTTP method
          }
        },
        child: const Text(
          'Add new person',
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.teal),
      ),
    );
  }
}
