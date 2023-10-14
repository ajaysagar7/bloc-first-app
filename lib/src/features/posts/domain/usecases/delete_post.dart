// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_jsonplaceholder/core/utils/typedef.dart';
import 'package:bloc_jsonplaceholder/core/utils/use_case.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/repositories/post_repository.dart';

class DeletePostUseCase extends UseCaseWithParams<void, String> {
  final PostRepository postRepository;
  DeletePostUseCase({
    required this.postRepository,
  });

  @override
  ResultFuture<void> call(String params) async {
    return await postRepository.deletePost(params);
  }

  
}
