// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'assign_bloc.dart';

@immutable
sealed class AssignEvent {}

class CreateclassEvent extends AssignEvent {
  final String classname;
  CreateclassEvent({
    required this.classname,
  });
}

class AddUserToClassRoomEvent extends AssignEvent {
  final List users;
  final ClassRoom classRoom;
  final String role;
  AddUserToClassRoomEvent({
    required this.users,
    required this.classRoom,
    required this.role,
  });
}

class DeleteClassRoomUser extends AssignEvent {
  final String userid;
  final String role;
  DeleteClassRoomUser({
    required this.userid,
    required this.role,
  });
}

class DeleteClassRoom extends AssignEvent {
  final ClassRoom classRoom;
  DeleteClassRoom({
    required this.classRoom,
  });
}
