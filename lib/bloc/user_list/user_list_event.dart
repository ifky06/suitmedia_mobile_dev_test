part of 'user_list_bloc.dart';

@immutable
sealed class UserListEvent {}

class GetUserList extends UserListEvent {
  final int page;
  final int pageSize;

  GetUserList(this.page, this.pageSize);
}
class ResetUserList extends UserListEvent {}