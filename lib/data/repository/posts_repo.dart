import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_soft/data/model/posts.dart';

/// [PostsRepository] a repository class for app configartion
class PostsRepository {
  /// [getPosts] function to get posts
  Future<List<Posts>?> getPosts() async {
    try {
      // Making the HTTP GET request
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final userJson = jsonDecode(response.body) as List<dynamic>;
        return userJson
            .map((json) => Posts.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load post');
      }
    } catch (e) {
      debugPrint('Caught error: $e');
    }
    return null;
  }
}
