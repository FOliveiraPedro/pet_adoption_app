// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

enum ErrorCode {
  AP400,
  AP401,
  AP403,
  AP404,
  AP413,
  AP422,
  AP500,
  DOM01,
  DAT01,
  INF01,
  PRE01,
  RMO01,
  RMO02,
  LMO01,
  LMO02,
  SST01,
  SST02,
  SST03,
  UNEXP,
  CONNE,
}

class DomainError extends Equatable implements Exception {
  final ErrorCode code;
  final String message;
  final Map<String, dynamic> payload;

  const DomainError({
    required this.code,
    required this.message,
    required this.payload,
  });

  @override
  String toString() => code.name;

  @override
  List<Object> get props => [code, message, payload];
}

extension DomainErrorExtension on DomainError {
  DomainError toDomainError() =>
      DomainError(code: code, message: message, payload: payload);
}
