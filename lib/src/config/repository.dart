import 'package:aion/src/model/driver_modal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('driver');

  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addPet(DriverData driver) {
    return collection.add(driver.toJson());
  }

  updatePet(DriverData driver) async {
    await collection.doc(driver.reference.id).update(driver.toJson());
  }
}
