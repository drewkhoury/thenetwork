import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:thenetworkapp/services/auth.dart';
import 'package:thenetworkapp/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Listens to current user's report document in Firestore
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('reports').doc(user.uid);
        return ref.snapshots().map((doc) => Report.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Report()]);
      }
    });
  }

  /// Updates the current user's report document with coffee preferences
  Future<void> updateUserReport(String coffee) {
    var user = AuthService().user!;
    var ref = _db.collection('reports').doc(user.uid);

    var data = {'coffeePreference': coffee};

    return ref.set(data, SetOptions(merge: true));
  }
}
