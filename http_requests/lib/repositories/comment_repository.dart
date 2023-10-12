import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_requests/models/comment.dart';

class CommentRepository {
  Future<List<Comment>> fetchComments(int postId) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments'));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return (json as List).map((item) => Comment.fromJson(item)).toList();
    }
    return [];
  }
}
