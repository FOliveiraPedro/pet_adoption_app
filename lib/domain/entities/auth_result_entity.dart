import 'package:equatable/equatable.dart';

class AuthResultEntity extends Equatable {
  final String authToken;

  const AuthResultEntity({
    required this.authToken,
  });

  @override
  List<Object> get props => [authToken];
}
