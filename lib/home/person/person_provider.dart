import 'package:flutter/material.dart';

class PersonProvider with ChangeNotifier {
  //ignore: prefer_final_fields
  var _data = [
    {
      '_id': 'mizuki@moonlight.com',
      'name': '神崎美月',
      'age': 18,
      'gender': 'Female',
      'country': 'Japan',
      'imageUrl':
          'https://img.atwikiimg.com/www65.atwiki.jp/aikatsu-photo/attach/367/236/0569.jpg',
      'description':
          '常にアイカツランキングの第１位に輝く、正真正銘のトップアイドル。かつてはスターライト学園のアイドルだったが、今は学園を離れてしまっている。',
    },
  ];

  List<Map<String, dynamic>> get data => _data;
}
