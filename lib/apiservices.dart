import 'package:api/models/Datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResponseData {
  Future<List<PostModel>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonresponse = response.body;
      return postModelFromJson(jsonresponse);
    }
  }
}
