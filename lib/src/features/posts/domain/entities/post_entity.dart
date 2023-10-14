// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  

  @override
  List<Object> get props => [userId, id, title, body];
}
