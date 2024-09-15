import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/models/ClassRoom.dart';
import 'package:necadmin/utils.dart';

part 'assign_event.dart';
part 'assign_state.dart';

class AssignBloc extends Bloc<AssignEvent, AssignState> {
  AssignBloc() : super(AssignInitial()) {
    on<CreateclassEvent>(createclassevent);
    on<AddUserToClassRoomEvent>(addUserToClassRoomEvent);
    on<DeleteClassRoomUser>(deleteClassRoomUser);
    on<DeleteClassRoom>(deleteClassRooms);
  }

  FutureOr<void> createclassevent(
      CreateclassEvent event, Emitter<AssignState> emit) async {
    emit(CreateClassloadingState());
    List res = await createclass(classname: event.classname);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(CreateClassSuccessState());
        },
        failure: () {
          emit(CreateClassfailureState());
        });
  }

  FutureOr<void> addUserToClassRoomEvent(
      AddUserToClassRoomEvent event, Emitter<AssignState> emit) async {
    emit(AssignUserLoadingState());
    List<bool> res = await addUserToClassroom(
        classRoom: event.classRoom, role: event.role, user: event.users);
    emit(AssignUserSuccessState(result: res));
  }

  FutureOr<void> deleteClassRoomUser(
      DeleteClassRoomUser event, Emitter<AssignState> emit) async {
    emit(DeleteUserLoadingState());
    final deleteuser = await deleteClassRoomUserFunction(
        role: event.role, userid: event.userid);
    handlebloc(
        statuscode: deleteuser[0],
        success: () {
          emit(DeleteUserSucessState());
        },
        failure: () {
          emit(DeleteUserFailureState());
        });
  }

  FutureOr<void> deleteClassRooms(
      DeleteClassRoom event, Emitter<AssignState> emit) async {
    emit(DeleteClassRoomloadingState());
    List res = await deleteClassRoom(classroom: event.classRoom);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(DeleteClassRoomSuccessState());
        },
        failure: () {
          emit(DeleteClassRoomfailureState());
        });
  }
}
