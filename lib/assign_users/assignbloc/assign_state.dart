part of 'assign_bloc.dart';

@immutable
sealed class AssignState {}

final class AssignInitial extends AssignState {}

class CreateClassSuccessState extends AssignState{}

class CreateClassfailureState extends AssignState {}

class CreateClassloadingState extends AssignState {}
