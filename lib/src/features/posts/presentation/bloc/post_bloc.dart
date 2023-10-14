// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart'; // Import Either and Left
import 'package:equatable/equatable.dart';

import 'package:bloc_jsonplaceholder/core/error/failure.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/usecases/get_posts.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/usecases/get_singlepost.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCases getPostsUseCases;
  final GetSinglePostUseCase getSinglePostUseCase;

  PostBloc(
    this.getPostsUseCases,
    this.getSinglePostUseCase,
  ) : super(PostInitial()) {
    on<PostGetPostEvents>((event, emit) async {
     
     emit(PostLoading());
      try {
        Either<Failure, List<PostEntity>> result = await getPostsUseCases();
        result.fold(
          (failure) => emit(PostFailed(message: failure.message.toString())),
          (posts) => emit(PostLoaded(posts)),
        );
      } catch (e) {
        emit(PostFailed(message: e.toString()));
      }
    }
    );
    //! get single post

    on<PostGetPostByIdEvents>((event, emit) async {
      emit(PostLoading());
     await getSinglePostUseCase(event.id).then((result) {
        result.fold(
          (failure) => emit(PostFailed(message: failure.statusCode.toString())),
          (post) => emit(SinglePostLoaded(post)),
        );
      });
    },);
  
  
  
  
  }

  

}
