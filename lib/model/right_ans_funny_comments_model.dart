import 'dart:convert';
import 'package:flutter/services.dart';

class NameModel {
  final String name;

  NameModel({required this.name});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(name: json['name'] as String);
  }
}

class NameRepository {
  List<NameModel> _names = [];
  Future<List<NameModel>> loadNames() async {
    final jsonString = await rootBundle
        .loadString('assets/data/right_ans_funny_comments.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => NameModel.fromJson(json)).toList();
  }

  String getRandomName() {
    if (_names.isEmpty) {
      // Handle case when data is not loaded yet
      return 'Loading...';
    }
    final randomIndex = DateTime.now().millisecondsSinceEpoch % _names.length;
    return _names[randomIndex].name;
  }
}
