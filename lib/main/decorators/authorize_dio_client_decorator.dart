import '../../data/errors/errors.dart';
import '../../data/http/http.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../../domain/usecases/usecases.dart';

class AuthorizeDioClientDecorator implements HttpClient {
  final HttpClient decoratee;
  final FetchCurrentAccountUseCase fetchCurrentAccount;
  final DeleteCurrentAccountUseCase deleteCurrentAccount;

  AuthorizeDioClientDecorator({
    required this.decoratee,
    required this.fetchCurrentAccount,
    required this.deleteCurrentAccount,
  });

  @override
  Future<dynamic> request({
    required final String url,
    required final Method method,
    final Map<String, String> headers = const {},
    final Map<String, dynamic> queryParameters = const {},
    final Map body = const {},
    final List<Map<String, dynamic>> files = const [],
    final bool sendingMultipleFiles = false,
  }) async {
    try {
      final AccountEntity account = await fetchCurrentAccount.call();
      final Map<String, String> authorizedHeaders = {};
      if (headers.isEmpty) {
        authorizedHeaders.addAll({'Authorization': 'Bearer ${account.token}'});
      } else {
        headers.addAll({'Authorization': 'Bearer ${account.token}'});
      }
      return await decoratee.request(
        url: url,
        method: method,
        queryParameters: queryParameters,
        body: body,
        headers: authorizedHeaders,
        files: files,
        sendingMultipleFiles: sendingMultipleFiles,
      );
    } on HttpError catch (error) {
      if (error.code != ErrorCode.AP403) {
        rethrow;
      } else {
        await deleteCurrentAccount.call();
        throw HttpError.forbidden();
      }
    }
  }
}
