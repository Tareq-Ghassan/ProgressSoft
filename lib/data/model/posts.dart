/// [Posts] class create to hold posts
class Posts {
  ///[Posts] constructor
  Posts({this.id, this.title, this.body, this.userId});

  /// [Posts.fromJson] to convert `json` to `Posts` object
  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
    );
  }

  /// [id] represent postID
  int? id;

  /// [title] represent title
  String? title;

  /// [body] represent body
  String? body;

  /// [userId] user id
  int? userId;
}
