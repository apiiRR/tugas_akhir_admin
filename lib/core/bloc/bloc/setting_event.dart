part of 'setting_bloc.dart';

abstract class SettingEvent {}

class SettingLocation extends SettingEvent {
  SettingLocation(this.long, this.lat);

  final String long;
  final String lat;
}

class SettingTime extends SettingEvent {
  SettingTime(this.checkIn, this.checkOut);

  final String checkIn;
  final String checkOut;
}
