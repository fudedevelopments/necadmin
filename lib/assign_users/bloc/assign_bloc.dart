import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'assign_event.dart';
part 'assign_state.dart';

class AssignBloc extends Bloc<AssignEvent, AssignState> {
  AssignBloc() : super(AssignInitial()) {
    on<AssignEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
