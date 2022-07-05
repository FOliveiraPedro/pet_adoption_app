import '../../entities/entities.dart';

abstract class FetchCurrentAccountUseCase {
  Future<AccountEntity> call();
}
