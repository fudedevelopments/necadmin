// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'classroom_bloc.dart';

@immutable
sealed class ClassroomEvent {}

class GetallClassroomUsers extends ClassroomEvent {
  final String classroomid;
  GetallClassroomUsers({
    required this.classroomid,
  });
}


