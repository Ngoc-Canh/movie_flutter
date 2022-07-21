import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_flutter/data/model/topic.dart';

abstract class TopicStorage {
  Future<List<Topic>> load();
}

class AssetTopicStorage extends TopicStorage {
  @override
  Future<List<Topic>> load() async {
   final jsonContent = await rootBundle.loadString("mock_data/topics/topics.json");
   final List<dynamic> jsonParse = jsonDecode(jsonContent);
   return jsonParse.map((e) => Topic.fromJson(e)).toList();
  }
}