part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
final class PostLoading extends PostState {}
class PostLoaded extends PostState {
  final List<PostEntity> posts;
  const PostLoaded(this.posts, );

  @override
  List<Object> get props => [posts];
}
final class PostFailed extends PostState {
  final String message;

  PostFailed({required this.message});


}

class SinglePostLoaded extends PostState {
  final PostEntity post;

  const SinglePostLoaded(this.post);

  @override
  List<Object> get props => [post];
}
