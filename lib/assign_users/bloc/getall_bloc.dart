import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

part 'getall_event.dart';
part 'getall_state.dart';

class GetallBloc extends Bloc<GetallEvent, GetallState> {
  GetallBloc() : super(GetallInitial()) {
    on<AllClassevent>(allClassevent);
  }

  FutureOr<void> allClassevent(
      AllClassevent event, Emitter<GetallState> emit) async {
    emit(AllclassesLoadingState());
    List res = await getAllClasses();
    handlebloc(
      statuscode: res[0],
      success: () {
        emit(AllclassesSuccessState(classroomlist: res[1]));
      },
      failure: () {
        emit(AllclassesfailureState());
      },
      empty: () {
        emit(AllclassesEmptyState());
      },
    );
  }
}
