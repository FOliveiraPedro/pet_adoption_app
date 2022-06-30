import '../../entities/entities.dart';

abstract class SaveCurrentAccountUseCase {
  Future<void> call({required final AccountEntity account});
}
