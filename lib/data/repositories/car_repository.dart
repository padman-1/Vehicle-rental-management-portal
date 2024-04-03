import 'package:cloud_firestore/cloud_firestore.dart';

class CarRepository {
  Stream<QuerySnapshot> getCar() {
    return FirebaseFirestore.instance.collection('Cars').snapshots();
  }
}
