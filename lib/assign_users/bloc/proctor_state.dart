// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'proctor_bloc.dart';

@immutable
sealed class ProctorState {}

final class ProctorInitial extends ProctorState {}

class GetAllProctorsStudentsSuccessState extends ProctorState {
 final List<Student> students;
  GetAllProctorsStudentsSuccessState({
    required this.students,
  });
}

class GetAllProctorsStudentsFailureState extends ProctorState {}

class GetAllProctorsStudentsLoadingState extends ProctorState {}

class GetAllProctorsStudentsEmptyState extends ProctorState {}


