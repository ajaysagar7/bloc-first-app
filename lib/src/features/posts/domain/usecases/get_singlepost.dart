// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_jsonplaceholder/core/utils/typedef.dart';
import 'package:bloc_jsonplaceholder/core/utils/use_case.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/repositories/post_repository.dart';

class GetSinglePostUseCase extends UseCaseWithParams<PostEntity,String> {
  final PostRepository postRepository;
  GetSinglePostUseCase({
    required this.postRepository,
  });

  @override
  ResultFuture<PostEntity> call(String params) async {
    return await postRepository.getPost(params);
  }
}
