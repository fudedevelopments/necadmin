// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'assign_bloc.dart';

@immutable
sealed class AssignState {}

final class AssignInitial extends AssignState {}

class CreateClassSuccessState extends AssignState {}

class CreateClassfailureState extends AssignState {}

class CreateClassloadingState extends AssignState {}

class AssignUserSuccessState extends AssignState {
  final List<bool> result;
  AssignUserSuccessState({
    required this.result,
  });
}

class AssignUserLoadingState extends AssignState {}

class AssignUserFailureState extends AssignState {}

class DeleteUserSucessState extends AssignState {}

class DeleteUserFailureState extends AssignState {}

class DeleteUserLoadingState extends AssignState {}

class DeleteClassRoomSuccessState extends AssignState {}

class DeleteClassRoomfailureState extends AssignState {}

class DeleteClassRoomloadingState extends AssignState {}

class AddStudentsUnderProctorSuccessState extends AssignState {
  final List<bool> results;
  AddStudentsUnderProctorSuccessState({
    required this.results,
  });
}

class AddStudentsUnderProctorloadingtate extends AssignState {}
