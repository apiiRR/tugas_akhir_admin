part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserComplete extends UserState {}

class UserError extends UserState {
  UserError(this.message);

  final String message;
}
