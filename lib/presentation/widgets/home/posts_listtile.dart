import 'package:flutter/material.dart';
import 'package:progress_soft/data/model/posts.dart';
import 'package:progress_soft/presentation/controller/home_page_view_controller.dart';

/// [PostsListTile] represent posts
class PostsListTile extends StatelessWidget {
  /// [PostsListTile] constructor
  const PostsListTile({required this.post, super.key});

  /// [post] represent selected post
  final Posts post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: const Alignment(1, -0.01),
              end: const Alignment(-1, 0.01),
              colors: randomGradient(),
            ),
          ),
        ),
      ),
      title: Text(post.title ?? ''),
      subtitle: Text(post.body ?? ''),
    );
  }
}
