import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String name;
  final String token;

  const AccountEntity({
    required this.name,
    required this.token,
  });

  @override
  List<Object> get props => [name, token];
}
