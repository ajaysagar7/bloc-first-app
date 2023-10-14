import 'package:bloc_jsonplaceholder/core/network/dio_client.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/data/datasource/post_remote_datasource.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/data/repository/post_repository_impl.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/repositories/post_repository.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/usecases/get_posts.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/domain/usecases/get_singlepost.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/presentation/bloc/post_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // locator
  //   ..registerFactory(() => CourseBloc(
  //       getCourseUseCase: locator(), getFeaturedCourseUseCase: locator()))
  //   ..registerLazySingleton(() => GetCourseUseCase(locator()))
  //   ..registerLazySingleton<CourseRepository>(
  //       () => CourseRepositoryImpl(locator()))
  //   ..registerLazySingleton<CourseRemoteDataSource>(
  //       () => CourseRemoteDataSourceImpl());



  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton(() => DioClient(locator()));

  // BLOCS
  locator.registerFactory(() => PostBloc( locator(), locator()));
  locator.registerLazySingleton(() => GetPostsUseCases(locator()));
  locator.registerLazySingleton(() => GetSinglePostUseCase(postRepository: locator()));
  locator.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSouceImpl(dioClient: locator()));
  locator.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(remoteDataSource: locator()));
  }