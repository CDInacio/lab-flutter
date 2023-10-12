import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_requests/models/post.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var jsonPosts = jsonDecode(response.body);
      return (jsonPosts as List).map((post) => Post.fromJson(post)).toList();
    }
    return [];
  }
}
