// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'proctor_bloc.dart';

@immutable
sealed class ProctorEvent {}

class GetAllProctorsStudents extends ProctorEvent {
  final Proctor proctor;
  GetAllProctorsStudents({
    required this.proctor,
  });
}
