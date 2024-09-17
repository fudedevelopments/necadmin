import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/models/ModelProvider.dart';
part 'classroom_event.dart';
part 'classroom_state.dart';

class ClassroomBloc extends Bloc<ClassroomEvent, ClassroomState> {
  ClassroomBloc() : super(ClassroomInitial()) {
    on<GetallClassroomUsers>(getallClassroomUsers);

  }

  FutureOr<void> getallClassroomUsers(
      GetallClassroomUsers event, Emitter<ClassroomState> emit) async {
    emit(GetAllClassRoomUsersLoadingState());
    List res =
        await getAllClassroomUsersFunction(classroomid: event.classroomid);
    if (res[0] == 200) {
      emit(GetAllClassRoomUsersSuccessState(
          hodlist: res[1],
          aclist: res[2],
          proctorlist: res[3],
          studentlist: res[4]));
    }
    if (res[0] == 500) {
      emit(GetAllClassRoomUsersFailureState());
    }
  }

 
}
