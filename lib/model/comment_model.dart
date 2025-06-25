import 'package:meta/meta.dart';
import 'dart:convert';

class CommentModel {
    final int postId;
    final int id;
    final String name;
    final String email;
    final String body;

    CommentModel({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    CommentModel copyWith({
        int? postId,
        int? id,
        String? name,
        String? email,
        String? body,
    }) => 
        CommentModel(
            postId: postId ?? this.postId,
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            body: body ?? this.body,
        );

    factory CommentModel.fromRawJson(String str) => CommentModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
