import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart' show AuthResultEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;

class RemoteAuthResultModel extends Equatable {
  final String authToken;

  const RemoteAuthResultModel({
    required this.authToken,
  });

  factory RemoteAuthResultModel.fromJson({required final Json json}) {
    if (json.keys.toSet().containsAll([
      'authToken',
    ])) {
      try {
        return RemoteAuthResultModel(
          authToken: (json['authToken'] ?? '').toString(),
        );
      } on ModelError {
        throw ModelError.remoteParseData(message: 'Erro ao buscar o usuário!');
      }
    } else {
      throw ModelError.remoteInvalidData(message: 'Erro ao buscar o usuário!');
    }
  }

  AuthResultEntity toEntity() => AuthResultEntity(
        authToken: authToken,
      );

  @override
  List<Object> get props => [authToken];
}
