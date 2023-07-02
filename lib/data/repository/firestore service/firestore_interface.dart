import 'package:admin/domain/model/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/model/attedance_model.dart';
import '../../../domain/model/leave_model.dart';

abstract class FirestoreInterface {
  Stream<QuerySnapshot<ProfileModel>> streamProfile();
  Stream<QuerySnapshot<AttedanceModel>> streamAttedance();
  Stream<QuerySnapshot<LeaveModel>> streamLeave();
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamSetting();
}
