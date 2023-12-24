import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_mobile_dev_test/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUser>((event, emit) {
      emit(UserLoaded(event.user));
    });
  }
}
