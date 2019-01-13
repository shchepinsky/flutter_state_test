import 'package:meta/meta.dart';

class Comment {
  final String postId;
  final String id;
  final String name;
  final String email;
  final String body;

  Comment(
      {@required this.id,
      @required this.postId,
      @required this.name,
      @required this.email,
      @required this.body});

  static fromJSON(Map json) {
    return Comment(
        id: json['id'].toString(),
        postId: json['postId'].toString(),
        name: json['name'].toString(),
        email: json['email'].toString(),
        body: json['body'].toString());
  }

  toJSON() {
    final Map<String, dynamic> json = Map();
    json['id'] = id;
    json['postId'] = postId;
    json['name'] = name;
    json['email'] = email;
    json['body'] = body;

    return json;
  }
}
