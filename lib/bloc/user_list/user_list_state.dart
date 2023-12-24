part of 'user_list_bloc.dart';

@immutable
sealed class UserListState {}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<User> users;
  final bool hasReachedMax;

  UserListLoaded(this.users, this.hasReachedMax);
}

