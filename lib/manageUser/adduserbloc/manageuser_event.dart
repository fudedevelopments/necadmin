// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manageuser_bloc.dart';

@immutable
sealed class ManageuserEvent {}

class AdduserToGroup extends ManageuserEvent {
  final String role;
  final String userId;
  AdduserToGroup({
    required this.role,
    required this.userId,
  });
}

class CreateUserEvent extends ManageuserEvent {
  final String name;
  final String email;
  final String password;
  CreateUserEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}
