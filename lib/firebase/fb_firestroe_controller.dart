

import 'package:cloud_firestore/cloud_firestore.dart';

class FbFirestoreController {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static FbFirestoreController? _instance;

  FbFirestoreController._();

  factory FbFirestoreController() {
    return _instance ??= FbFirestoreController._();

  }


}
