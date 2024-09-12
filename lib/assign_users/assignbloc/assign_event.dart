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
