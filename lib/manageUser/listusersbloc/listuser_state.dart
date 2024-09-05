// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'listuser_bloc.dart';

@immutable
sealed class ListuserState {}

final class ListuserInitial extends ListuserState {}

class ListAllGroupUsersSuccessState extends ListuserState {
  final List<dynamic> allmodels;
  ListAllGroupUsersSuccessState({
    required this.allmodels,
  });
}

class ListAllGroupUsersFailureState extends ListuserState {}

class ListAllGroupUsersLoadingState extends ListuserState {}

