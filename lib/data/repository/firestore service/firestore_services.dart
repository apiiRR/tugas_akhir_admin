import 'package:admin/domain/model/attedance_model.dart';
import 'package:admin/domain/model/leave_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../../../domain/model/profile_model.dart';
import 'firestore_interface.dart';

class FirestoreServices implements FirestoreInterface {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<ProfileModel>> streamProfile() async* {
    CollectionReference<Map<String, dynamic>> colProfile =
        firestore.collection("accounts");

    yield* colProfile
        .withConverter(
            fromFirestore: (snapshot, _) =>
                ProfileModel.fromJson(snapshot.data()!),
            toFirestore: (attedance, _) => attedance.toJson())
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<AttedanceModel>> streamAttedance() async* {
    CollectionReference<Map<String, dynamic>> colProfile =
        firestore.collection("attedances");

    yield* colProfile
        .withConverter(
            fromFirestore: (snapshot, _) =>
                AttedanceModel.fromJson(snapshot.data()!),
            toFirestore: (attedance, _) => attedance.toJson())
        .snapshots();
  }

  @override
  Stream<QuerySnapshot<LeaveModel>> streamLeave() async* {
    CollectionReference<Map<String, dynamic>> colProfile =
        firestore.collection("leaves");

    yield* colProfile
        .withConverter(
            fromFirestore: (snapshot, _) =>
                LeaveModel.fromJson(snapshot.data()!),
            toFirestore: (attedance, _) => attedance.toJson())
        .snapshots();
  }

  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamSetting() async* {
    DocumentReference<Map<String, dynamic>> colSetting =
        firestore.collection("settings").doc("0Ur97iTtMNvCpRku68IG");

    yield* colSetting.snapshots();
  }
}
