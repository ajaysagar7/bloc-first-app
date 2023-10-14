// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc_jsonplaceholder/core/network/dio_client.dart';
import 'package:bloc_jsonplaceholder/core/network/dio_errors_custom.dart';
import 'package:bloc_jsonplaceholder/core/utils/app_util.dart';
import 'package:bloc_jsonplaceholder/src/features/posts/data/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
  Future<PostModel> getPost({required String id});
  Future<void> deletePost({required String id});
}

class PostRemoteDataSouceImpl implements PostRemoteDataSource {
  final DioClient dioClient;
  PostRemoteDataSouceImpl({
    required this.dioClient,
  });
  @override
  Future<void> deletePost({required String id}) async {
      try {
        final response = await dioClient.get('/posts/$id');

        if(response.statusCode == 200) {
          
        }else {
          throw Exception('Error');
        }
      }catch(e) {
        rethrow;
      }
  }

  @override
  Future<PostModel> getPost({required String id}) async {
    try {
      final response =  await dioClient.get('/posts/$id');
      if(response.statusCode == 200) {
        return PostModel.fromMap(response.data);

      }else {
        throw Exception('Error');
      }
    }on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions, response: e.response);
    }
    
     catch (e) {
      rethrow;
      
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dioClient.get('https://jsonplaceholder.typicode.com/posts');
      if(response.statusCode == 200) {
        AppUtil.debugPrint("Posts api is successfull");
        final List posts = response.data ;
      List<PostModel> postsLists = posts.map((post) => PostModel.fromMap(post)).toList(); 
      log(postsLists.length.toString());

      return postsLists;
      } else {
        AppUtil.debugPrint("post api response code is not 200");
        throw Exception(response.statusCode);
      }
    } on DioException catch(e) {
      return handleDioException(e);
    }
    
    catch (e) {
      return handleGenericError(e);
    }
  }

}
