import 'dart:convert';

import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
    final int userId;
    final int id;
    final String title;
    final String body;

   const PostModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    }) : super(userId: 0, id: 0, title: '', body: '');

    PostModel copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        PostModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory PostModel.fromJson(String str) => PostModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
