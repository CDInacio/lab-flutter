import 'package:flutter/material.dart';
import 'package:http_requests/models/post.dart';
import 'package:http_requests/repositories/post_repository.dart';
import 'package:http_requests/screens/comment.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  PostRepository postRepo = PostRepository();
  var posts = <Post>[];
  bool isLoading = true;

  void loadPosts() async {
    List<Post> loadedPosts = await postRepo.fetchPosts();
    setState(() {
      posts = loadedPosts;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: CircularProgressIndicator());

    if (!isLoading) {
      content = ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, index) {
          var post = posts[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => CommentScreen(postId: post.id!))),
            child: ListTile(
                title: Text(post.title!),
                subtitle: Text('${post.body!.substring(0, 70)}...')),
          );
        },
      );
    }

    return Scaffold(body: content);
  }
}
