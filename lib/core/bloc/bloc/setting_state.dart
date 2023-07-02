part of 'setting_bloc.dart';

abstract class SettingState {}

class SettingInitial extends SettingState {}

class SettingLoading extends SettingState {}

class SettingComplete extends SettingState {}

class SettingError extends SettingState {
  SettingError(this.message);

  final String message;
}
