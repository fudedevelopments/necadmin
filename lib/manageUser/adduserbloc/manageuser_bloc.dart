import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/manageUser/repository/manage_repo.dart';
import 'package:necadmin/utils.dart';

part 'manageuser_event.dart';
part 'manageuser_state.dart';

class ManageuserBloc extends Bloc<ManageuserEvent, ManageuserState> {
  ManageuserBloc() : super(ManageuserInitial()) {
    on<CreateUserEvent>(createUserEvent);
    on<AdduserToGroup>(adduserToGroup);
  }

  FutureOr<void> createUserEvent(
      CreateUserEvent event, Emitter<ManageuserState> emit) async {
    emit(CreateUserLoadingState());
    List res = await createUser(
        name: event.name, email: event.email, password: event.password);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(CreateUserSuccessState(userId: res[1]));
        },
        failure: () {
          emit(CreateUserFailureState(errors: res[1]));
        });
  }

  FutureOr<void> adduserToGroup(
      AdduserToGroup event, Emitter<ManageuserState> emit) async {
    emit(AddusertoGroupLoadingState());
    List res = await addusertoGroup(role: event.role, userId: event.userId);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(AddusertoGroupSucessState());
        },
        failure: () {
          emit(AddusertoGroupFailureState());
        });
  }
}
