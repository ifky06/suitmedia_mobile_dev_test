import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suitmedia_mobile_dev_test/models/user.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitial()) {
    on<GetUserList>((event, emit) async {
      final currentUsers = state is UserListLoaded ? (state as UserListLoaded).users : <User>[];
      try{
        final newUsers = await User.getUsers(event.page, event.pageSize);
        emit(UserListLoaded(
          currentUsers + newUsers,
          !((currentUsers.length + newUsers.length) < User.totalUsers)
        ));
      } catch (e) {
        emit(UserListLoaded(currentUsers, true));
      }
    });
    on<ResetUserList>((event, emit) {
      emit(UserListInitial());
    });
  }
}
