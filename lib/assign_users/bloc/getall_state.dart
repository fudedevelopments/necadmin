// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'getall_bloc.dart';

@immutable
sealed class GetallState {}

final class GetallInitial extends GetallState {}

class AllclassesSuccessState extends GetallState {
final List<ClassRoom> classroomlist;
  AllclassesSuccessState({
    required this.classroomlist,
  });
}

class AllclassesfailureState extends GetallState {}

class AllclassesLoadingState extends GetallState {}

class AllclassesEmptyState extends GetallState {}