import 'package:dio/dio.dart';
import 'package:templateapp/core/errors/data/models/app_error.dart';
import 'package:templateapp/core/http/data/models/custom_response.dart';

abstract class Corerepository {
  Future<CustomResponse<T>> get<T>({
    required String endpoint,
    Function? convert,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<CustomResponse<T>> post<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Function? convert,
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<CustomResponse<T>> put<T>({
    required String endpoint,
    Function? convert,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<CustomResponse<T>> delete<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Function? convert,
  });
}

//TODO: add better error handling, add error handling for the response status code, add error handling for the response data
class CoreRepositoryImpl implements Corerepository {
  static late Dio _dio;

  CoreRepositoryImpl() {
    _dio = Dio();
  }

  @override
  Future<CustomResponse<T>> get<T>({
    required String endpoint,
    Function? convert,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final data = convert != null ? convert.call(response.data) : response.data;
      return CustomResponse<T>(data: data);
    } catch (error) {
      return CustomResponse<T>(error: AppError(error.toString()));
    }
  }

  @override
  Future<CustomResponse<T>> post<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Function? convert,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      final data = convert != null ? convert.call(response.data) : response.data;
      return CustomResponse<T>(data: data);
    } catch (error) {
      return CustomResponse<T>(error: AppError(error.toString()));
    }
  }

  @override
  Future<CustomResponse<T>> put<T>({
    required String endpoint,
    Function? convert,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        data: body,
      );
      final data = convert != null ? convert.call(response.data) : response.data as T;
      return CustomResponse<T>(data: data);
    } catch (error) {
      return CustomResponse<T>(error: AppError(error.toString()));
    }
  }

  @override
  Future<CustomResponse<T>> delete<T>({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Function? convert,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final data = convert != null ? convert.call(response.data) : response.data as T;
      return CustomResponse<T>(data: data);
    } catch (error) {
      return CustomResponse<T>(error: AppError(error.toString()));
    }
  }
}
