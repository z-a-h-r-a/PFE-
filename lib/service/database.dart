import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //create
  Future addAnimalDetails(Map<String, dynamic> animalInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Animals")
        .doc(id)
        .set(animalInfoMap);
  }

//read
  Future<Stream<QuerySnapshot>> getAnimalsDetails() async {
    return FirebaseFirestore.instance.collection("Animals").snapshots();
  }

//update
  Future updateAnimalsDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Animals")
        .doc(id)
        .update(updateInfo);
  }

  //delete
  Future deleteAnimalsDetails(String id) async {
    return await FirebaseFirestore.instance
        .collection("Animals")
        .doc(id)
        .delete();
  }
}

class UsersMethods {
  Future userDetails(Map<String, dynamic> userlInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(userlInfoMap);
  }
}
