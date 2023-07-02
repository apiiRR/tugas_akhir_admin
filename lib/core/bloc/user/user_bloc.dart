import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/model/profile_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserBloc() : super(UserInitial()) {
    on<UserAddData>((event, emit) async {
      try {
        emit(UserLoading());

        DateTime now = DateTime.now();

        CollectionReference<Map<String, dynamic>> collProfile =
            firestore.collection("accounts");

        final UserCredential register =
            await auth.createUserWithEmailAndPassword(
                email: event.profile.email, password: "123456789");

        final User? user = register.user;

        if (user == null) return;

        final ProfileModel profile = ProfileModel(
            email: event.profile.email,
            employeeId: event.profile.employeeId,
            name: event.profile.name,
            phone: event.profile.phone,
            position: event.profile.position,
            photo: event.profile.photo,
            createdAt: now.toIso8601String(),
            uid: user.uid);

        await collProfile.doc(user.uid).set(profile.toJson());

        emit(UserComplete());
      } on FirebaseException catch (e) {
        emit(UserError(e.message ?? "Register failed"));
      } catch (e) {
        print(e);
        emit(UserError("Attedance failed"));
      }
    });
  }
}
