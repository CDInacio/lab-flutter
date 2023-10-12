import 'package:flutter/material.dart';
import 'package:http_requests/models/comment.dart';
import 'package:http_requests/repositories/comment_repository.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.postId});

  final int postId;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  var comments = <Comment>[];
  CommentRepository commentRepository = CommentRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadComment();
  }

  void loadComment() async {
    List<Comment> commentsData =
        await commentRepository.fetchComments(widget.postId);
    setState(() {
      comments = commentsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = CircularProgressIndicator();

    return Scaffold(
        appBar: AppBar(title: Text('Post detail ${widget.postId}')),
        body: comments.length == 0
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(16),
                child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (ctx, index) => Card(
                          color: Theme.of(context).colorScheme.secondary,
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(comments[index].id.toString()),
                                Text(comments[index].email!)
                              ],
                            ),
                            Text(comments[index].body!)
                          ]),
                        )),
              ));
  }
}
