import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../exceptions/app_exceptions.dart';

class DioHelper {
  final Dio dio;

  DioHelper({required this.dio});

  Options get _jsonOptions => Options(
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        responseType: ResponseType.json,
      );

  Options _withAuth(String? token) => token != null
      ? _jsonOptions.copyWith(
          headers: {...?_jsonOptions.headers, 'Authorization': 'Bearer $token'},
        )
      : _jsonOptions;

  Future<dynamic> getApi({
    required String url,
    bool isAuthRequired = false,
    String? authToken,
    Object? requestBody,
  }) async {
    try {
      final response = await dio.get(
        url,
        options: isAuthRequired ? _withAuth(authToken) : _jsonOptions,
        data: requestBody,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> postApi({
    required String url,
    bool isAuthRequired = false,
    String? authToken,
    Object? requestBody,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: requestBody,
        options: isAuthRequired ? _withAuth(authToken) : _jsonOptions,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> putApi({
    required String url,
    bool isAuthRequired = false,
    String? authToken,
    Object? requestBody,
  }) async {
    try {
      final response = await dio.put(
        url,
        options: isAuthRequired ? _withAuth(authToken) : _jsonOptions,
        data: requestBody,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> patchApi({
    required String url,
    bool isAuthRequired = false,
    String? authToken,
    Object? requestBody,
  }) async {
    try {
      final response = await dio.patch(
        url,
        options: isAuthRequired ? _withAuth(authToken) : _jsonOptions,
        data: requestBody,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> deleteApi({
    required String url,
    bool isAuthRequired = false,
    String? authToken,
    Object? requestBody,
  }) async {
    try {
      final response = await dio.delete(
        url,
        options: isAuthRequired ? _withAuth(authToken) : _jsonOptions,
        data: requestBody,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      if (e is AppException) rethrow;
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> sendMultipartRequest({
    required String url,
    Map<String, dynamic>? fields,
    List<FileUploadModel>? files,
    bool isAuthRequired = false,
    String? authToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formData = FormData();

      fields?.forEach((key, value) {
        formData.fields.add(MapEntry(key, value.toString()));
      });

      if (files != null) {
        for (final fileModel in files) {
          final file = File(fileModel.filePath);
          if (!await file.exists()) {
            throw Exception('File not found: ${fileModel.filePath}');
          }
          final fileName = fileModel.fileName ?? file.path.split('/').last;
          formData.files.add(MapEntry(
            fileModel.fieldName,
            await MultipartFile.fromFile(
              file.path,
              filename: fileName,
              contentType: fileModel.contentType,
            ),
          ));
        }
      }

      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            if (isAuthRequired && authToken != null)
              'Authorization': 'Bearer $authToken',
          },
        ),
        onSendProgress: onSendProgress,
      );
      return response.data;
    } on DioException catch (e) {
      _rethrowMapped(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> uploadSingleFile({
    required String url,
    required String fieldName,
    required String filePath,
    Map<String, dynamic>? additionalFields,
    bool isAuthRequired = false,
    String? authToken,
    ProgressCallback? onSendProgress,
  }) =>
      sendMultipartRequest(
        url: url,
        fields: additionalFields,
        files: [FileUploadModel(fieldName: fieldName, filePath: filePath)],
        isAuthRequired: isAuthRequired,
        authToken: authToken,
        onSendProgress: onSendProgress,
      );

  Future<dynamic> uploadMultipleFiles({
    required String url,
    required String fieldName,
    required List<String> filePaths,
    Map<String, dynamic>? additionalFields,
    bool isAuthRequired = false,
    String? authToken,
    ProgressCallback? onSendProgress,
  }) =>
      sendMultipartRequest(
        url: url,
        fields: additionalFields,
        files: filePaths
            .map((p) => FileUploadModel(fieldName: fieldName, filePath: p))
            .toList(),
        isAuthRequired: isAuthRequired,
        authToken: authToken,
        onSendProgress: onSendProgress,
      );

  Never _rethrowMapped(DioException e) {
    final inner = e.error;
    if (inner is AppException) throw inner;
    throw FetchDataException(e.message ?? 'Request failed');
  }
}

class FileUploadModel {
  final String fieldName;
  final String filePath;
  final String? fileName;
  final MediaType? contentType;

  const FileUploadModel({
    required this.fieldName,
    required this.filePath,
    this.fileName,
    this.contentType,
  });
}
