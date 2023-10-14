import 'package:bloc_jsonplaceholder/core/utils/typedef.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  const PostRepository();

  ResultFuture<List<PostEntity>> getPosts();
  ResultFuture<PostEntity> getPost(String id);
  // ResultFuture<PostEntity> createPost(Post post);
  // ResultFuture<PostEntity> updatePost(Post post);
  ResultFuture<void> deletePost(String id);
}