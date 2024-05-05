import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> fetchUsers_(FirebaseFirestore firestore) async {
  try {
    final QuerySnapshot querySnapshot =
        await firestore.collection('Users').get();
    return querySnapshot.docs;
  } catch (e) {
    rethrow;
  }
}
