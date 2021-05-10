part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> users;

  UserLoadSuccess(this.users);

  @override
  List<Object> get props => [users];
}

class UserLoadFail extends UserState {
  final String error;

  UserLoadFail(this.error);

  @override
  List<Object> get props => [error];
}
