import 'package:bloc_jsonplaceholder/core/utils/typedef.dart';
import 'package:bloc_jsonplaceholder/core/utils/use_case.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/repositories/post_repository.dart';

class GetPostsUseCases extends UseCaseWithoutParams<List<PostEntity>> {
  const GetPostsUseCases(this.repository);
  final PostRepository repository;
  
  @override
  ResultFuture<List<PostEntity>> call() {
    return repository.getPosts();
  }



}