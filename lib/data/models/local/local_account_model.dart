import 'package:equatable/equatable.dart';

import '../../../domain/entities/entities.dart' show AccountEntity;
import '../../../shared/shared.dart' show Json;
import '../../errors/errors.dart' show ModelError;

class LocalAccountModel extends Equatable {
  final String name;
  final String token;

  const LocalAccountModel({
    required this.name,
    required this.token,
  });

  factory LocalAccountModel.fromJson({required final Json json}) {
    if (json.keys.toSet().containsAll([
      'name',
      'token',
    ])) {
      try {
        return LocalAccountModel(
          name: (json['name'] ?? '').toString(),
          token: (json['token'] ?? '').toString(),
        );
      } on ModelError {
        throw ModelError.localParseData();
      }
    } else {
      throw ModelError.localInvalidData();
    }
  }

  factory LocalAccountModel.fromDomain({required final AccountEntity entity}) {
    try {
      return LocalAccountModel(
        name: entity.name,
        token: entity.token,
      );
    } on ModelError {
      throw ModelError.localParseData();
    }
  }

  AccountEntity toEntity() => AccountEntity(
        name: name,
        token: token,
      );

  Json toJson() => {
        'name': name,
        'token': token,
      };

  @override
  List<Object> get props => [name, token];
}
