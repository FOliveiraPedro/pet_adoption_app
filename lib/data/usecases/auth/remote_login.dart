import '../../../domain/helpers/helpers.dart' show DomainErrorExtension;
import '../../../domain/usecases/usecases.dart' show AuthLoginUseCase, AuthLoginUseCaseParams;
import '../../errors/errors.dart' show HttpError, ModelError;
import '../../http/http.dart' show HttpClient;

class RemoteAuthLogin implements AuthLoginUseCase {
  final HttpClient client;
  final String url;

  RemoteAuthLogin({
    required this.client,
    required this.url,
  });

  @override
  Future<void> call({required final AuthLoginUseCaseParams params}) async {
    try {
    } on HttpError catch (error) {
      throw error.toDomainError();
    } on ModelError catch (error) {
      throw error.toDomainError();
    }
  }
}
