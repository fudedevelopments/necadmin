// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'manageuser_bloc.dart';

@immutable
sealed class ManageuserState {}

final class ManageuserInitial extends ManageuserState {}

class AddusertoGroupSucessState extends ManageuserState {}

class AddusertoGroupLoadingState extends ManageuserState {}

class AddusertoGroupFailureState extends ManageuserState {}

class CreateUserSuccessState extends ManageuserState {
  final String userId;
  CreateUserSuccessState({
    required this.userId,
  });
}

class CreateUserFailureState extends ManageuserState {
  final String errors;
  CreateUserFailureState({
    required this.errors,
  });
}

class CreateUserLoadingState extends ManageuserState {
}
