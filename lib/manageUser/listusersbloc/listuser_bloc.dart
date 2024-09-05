import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necadmin/manageUser/repository/manage_repo.dart';
import 'package:necadmin/utils.dart';

part 'listuser_event.dart';
part 'listuser_state.dart';

class ListuserBloc extends Bloc<ListuserEvent, ListuserState> {
  ListuserBloc() : super(ListuserInitial()) {
    on<ListuserEvent>((event, emit) async {
      emit(ListAllGroupUsersLoadingState());
      List res = await listUsersInGroup();
      handlebloc(
          statuscode: res[0],
          success: () {
            emit(ListAllGroupUsersSuccessState(allmodels: res[1]));
          },
          failure: () {
            emit(ListAllGroupUsersFailureState());
          });
    });
  }
}
