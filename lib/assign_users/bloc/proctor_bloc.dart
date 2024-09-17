import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/assign_users/classroom/classroom_bloc.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

part 'proctor_event.dart';
part 'proctor_state.dart';

class ProctorBloc extends Bloc<ProctorEvent, ProctorState> {
  ProctorBloc() : super(ProctorInitial()) {
    on<GetAllProctorsStudents>(getAllProctorsStudents);
  }

  FutureOr<void> getAllProctorsStudents(
      GetAllProctorsStudents event, Emitter<ProctorState> emit) async {
    emit(GetAllProctorsStudentsLoadingState());
    List res = await getallStudentsByProctor(proctor: event.proctor);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(GetAllProctorsStudentsSuccessState(students: res[1]));
        },
        failure: () {
          emit(GetAllProctorsStudentsFailureState());
        },
        empty: () {
          emit(GetAllProctorsStudentsEmptyState());
        });
  }
}
