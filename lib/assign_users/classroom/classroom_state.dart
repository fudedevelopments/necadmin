// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'classroom_bloc.dart';

@immutable
sealed class ClassroomState {}

final class ClassroomInitial extends ClassroomState {}

class GetAllClassRoomUsersSuccessState extends ClassroomState {
  final List<Hod> hodlist;
  final List<Ac> aclist;
  final List<Proctor> proctorlist;
  final List<Student> studentlist;

  GetAllClassRoomUsersSuccessState({
    required this.hodlist,
    required this.aclist,
    required this.proctorlist,
    required this.studentlist,
  });
}

class GetAllClassRoomUsersFailureState extends ClassroomState {}

class GetAllClassRoomUsersLoadingState extends ClassroomState {}

class GetAllClassRoomUsersEmptyState extends ClassroomState {}
