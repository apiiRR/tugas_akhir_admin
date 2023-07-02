part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserAddData extends UserEvent {
  UserAddData(this.profile);

  final ProfileModel profile;
}
