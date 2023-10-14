import 'dart:developer';
import 'dart:io';

import 'package:bloc_jsonplaceholder/core/network/endpoints.dart';
import 'package:dio/dio.dart';


class DioClient {
  //* dio instance
  final Dio _dio;
  // Dio _dio = getIt.get<Dio>();

  DioClient(
    this._dio,
  ) {
    _dio
      ..options.baseUrl = Endpoints.basicUrl
      ..options.connectTimeout =
          const Duration(seconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(seconds: Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json;
  }

  //! CREATING GET, POST, PUT, DELETE REQUESTS

  //* Get Method:--------------------------------------------------------------------------------------------------------------------
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? progressCallback}) async {
        String token = "";
    // var pref = locator.get<SharedPreferencesServices>();
    // String? token = await pref.getString(key: SharedPrefKeys.userToken);
    // ColorfulLogger().logDebug(token.toString());
    log(token.toString());
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(
            contentType: ContentType.json.toString(),
            headers: {"Authorization": "Bearer $token"}),
        onReceiveProgress: progressCallback,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  //* Post Method:--------------------------------------------------------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
       String token = "";
    // var testToken =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NGI1NjE2MjQ1OTkwNGQwMmFiMGE3ODYiLCJpYXQiOjE2ODk2MDg1NjB9.54l5QvewjGAX3CFOEPUY6nxOnYh0eOQQWWbyl7JoO40";
    // var pref = locator.get<SharedPreferencesServices>();
    // String? token = await pref.getString(key: SharedPrefKeys.userToken);
    // ColorfulLogger().logDebug(token.toString());
    log(token.toString());
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
            contentType: ContentType.json.toString(),
            headers: {"Authorization": "Bearer $token"}),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //* put(UPDATE) Method:----------------------------------------------------------------------------------------------------------------

  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
       String token = "";
    // var pref = locator.get<SharedPreferencesServices>();
    // String? token = await pref.getString(key: SharedPrefKeys.userToken);
    // ColorfulLogger().logDebug(token.toString());
    log(token.toString());
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        options: Options(
            contentType: ContentType.json.toString(),
            headers: {"Authorization": "Bearer $token"}),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //* Delete Method:----------------------------------------------------------------------------------------------------------------

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(url,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}