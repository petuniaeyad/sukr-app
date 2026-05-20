import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sukar/model/child_profile_model.dart';
import 'package:sukar/model/login_model.dart';

abstract class AppGeneral {
  static String chidId = '';
  static LoginModel? loginModel;
  static ChildProfileModel? childProfileModel;
  static DocumentSnapshot<Object?>? snapshot;
  static String? calsification = '';
}
