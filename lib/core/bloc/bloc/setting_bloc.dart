import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  SettingBloc() : super(SettingInitial()) {
    on<SettingLocation>((event, emit) async {
      try {
        emit(SettingLoading());

        DocumentReference<Map<String, dynamic>> colSetting =
            firestore.collection("settings").doc("0Ur97iTtMNvCpRku68IG");

        await colSetting.update({"lat": event.lat, "long": event.long});

        emit(SettingComplete());
      } on FirebaseException catch (e) {
        emit(SettingError(e.message ?? "Update failed"));
      } catch (e) {
        print(e);
        emit(SettingError("Update failed"));
      }
    });

    on<SettingTime>((event, emit) async {
      try {
        emit(SettingLoading());

        DocumentReference<Map<String, dynamic>> colSetting =
            firestore.collection("settings").doc("0Ur97iTtMNvCpRku68IG");

        await colSetting
            .update({"checkIn": event.checkIn, "checkOut": event.checkOut});

        emit(SettingComplete());
      } on FirebaseException catch (e) {
        emit(SettingError(e.message ?? "Update failed"));
      } catch (e) {
        print(e);
        emit(SettingError("Update failed"));
      }
    });
  }
}
