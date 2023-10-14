// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:bloc_jsonplaceholder/core/error/exception.dart';
import 'package:bloc_jsonplaceholder/core/error/failure.dart';
import 'package:bloc_jsonplaceholder/core/utils/app_util.dart';
import 'package:bloc_jsonplaceholder/core/utils/typedef.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/data/datasource/post_remote_datasource.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/entities/post_entity.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl extends PostRepository {
  final PostRemoteDataSource remoteDataSource;
  PostRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  ResultFuture<void> deletePost(String id) async {
    try {
     await remoteDataSource.deletePost(id: id);
     return const Right(Void);
    } on ServerException catch (e) {
      return  Left(ServerFailure(message: e.toString(), statusCode: 400));
    }
  }

  @override
  ResultFuture<PostEntity> getPost(String id) async {
   try {
     final post = await remoteDataSource.getPost(id: id);
     return Right(post);
   } on ServerException catch (e) {
     return Left(ServerFailure(message: e.toString(), statusCode: 400));
   }on DioException catch(e) {
      return Left(ServerFailure(message: e.toString(), statusCode: 400));
   }
  }

  @override
  ResultFuture<List<PostEntity>> getPosts() async {
    try {
      final posts = await remoteDataSource.getPosts();
      AppUtil.debugPrint("Response is right");
      return Right(posts);
    } on ServerException catch (e) {
            AppUtil.debugPrint("Response is left");

      return Left(ServerFailure(message: e.toString(), statusCode: 400));
    }catch (e) {
            AppUtil.debugPrint("Response is left catch");

      return Left(ServerFailure(message: e.toString(), statusCode: 400));
    }
  }

}
