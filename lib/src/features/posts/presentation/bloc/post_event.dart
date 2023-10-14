part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostGetPostEvents extends PostEvent {
  const PostGetPostEvents();
}

class PostGetPostByIdEvents extends PostEvent {
  final String id;

  PostGetPostByIdEvents({required this.id});

}
