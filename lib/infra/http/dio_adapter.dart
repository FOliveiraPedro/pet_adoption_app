import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../data/errors/errors.dart';
import '../../data/http/http.dart';
import '../../domain/usecases/usecases.dart';

class DioAdapter implements HttpClient {
  final Dio client;
  final Duration timeout;

  DioAdapter({
    required this.client,
    required this.timeout,
  });

  @override
  Future<dynamic> request({
    required String url,
    required Method method,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParameters = const {},
    Map body = const {},
    List<Map<String, dynamic>> files = const [],
    bool sendingMultipleFiles = false,
  }) async {
    Future<Response>? futureResponse;

    Response response = Response(
      data: '',
      requestOptions: RequestOptions(path: url),
      statusCode: 500,
      statusMessage: 'Future response is null',
    );

    final Options options = Options(headers: headers);

    final formData = await _createFormData(files, sendingMultipleFiles, body);


    try {
      if (method == Method.post) {
        futureResponse = client.post(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      } else if (method == Method.get) {
        futureResponse = client.get(
          url,
          options: options,
          queryParameters: queryParameters,
        );
      } else if (method == Method.put) {
        futureResponse = client.put(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      } else if (method == Method.patch) {
        futureResponse = client.patch(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      } else if (method == Method.delete) {
        futureResponse = client.delete(
          url,
          data: formData ?? body,
          options: options,
          queryParameters: queryParameters,
        );
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(timeout);
      }
    } on DioError catch (error) {
      throw _createHttpError(error);
    }
    return _handleResponse(response);
  }

  HttpError _createHttpError(DioError error) {
    final Map<String, dynamic> payload =
    error.response != null && error.response?.data != null ? Map.castFrom(error.response?.data) : {};

    final statusCode = error.response?.statusCode;

    switch (statusCode) {
      case 400:
        return HttpError.badRequest(message: error.message, payload: payload);
      case 401:
        return HttpError.unauthorized(message: error.message, payload: payload);
      case 403:
        return HttpError.forbidden(message: error.message, payload: payload);
      case 404:
        return HttpError.notFound(message: error.message, payload: payload);
      case 413:
        return HttpError.payloadTooLarge(
          message: error.message,
          payload: payload,
        );
      case 422:
        return HttpError.unprocessableEntity(
          message: error.message,
          payload: payload,
        );
      default:
        return HttpError.serverError();
    }
  }

  Future<FormData?> _createFormData(
      List<Map<String, dynamic>> files,
      bool sendingMultipleFiles,
      Map<dynamic, dynamic> body,
      ) async {
    FormData? formData;
    if (files.isNotEmpty) {
      if (files.length == 1 && sendingMultipleFiles == false) {
        formData = FormData.fromMap(
          {
            'file': await MultipartFile.fromFile(
              files[0]['path'] as String,
              filename: '${files[0]['fileName']}.${files[0]['subtype']}',
              contentType: MediaType(files[0]['type'], files[0]['subtype']),
            ),
          }..addAll(Map<String, dynamic>.from(body)),
        );
      } else {
        formData = FormData.fromMap(Map<String, dynamic>.from(body));
        for (final file in files) {
          formData.files.add(
            MapEntry(
              'files',
              await MultipartFile.fromFile(
                file['path'] as String,
                filename: '${file['fileName']}.${file['subtype']}',
                contentType: MediaType(file['type'], file['subtype']),
              ),
            ),
          );
        }
      }
    } else if (sendingMultipleFiles == true) {
      formData = FormData.fromMap(Map<String, dynamic>.from(body));
    }
    return formData;
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data ?? {};
    } else if (response.statusCode == 204) {
      return {};
    }
  }
}
