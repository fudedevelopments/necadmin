import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/utils.dart';

part 'assign_event.dart';
part 'assign_state.dart';

class AssignBloc extends Bloc<AssignEvent, AssignState> {
  AssignBloc() : super(AssignInitial()) {
    on<CreateclassEvent>(createclassevent);
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
}
