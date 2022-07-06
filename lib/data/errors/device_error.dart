import '../../domain/helpers/domain_error.dart';

class DeviceError extends DomainError {
  DeviceError() : super(code: ErrorCode.CONNE, message: '', payload: const {});
}
