import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<Map<String, String>>> fetchUserGames_(
    FirebaseFirestore firestore, String userId) {
  try {
    return firestore
        .collection('Games')
        .where('players', arrayContains: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return {
                'id': doc.id,
                'name': doc['name'] as String,
              };
            }).toList());
  } catch (e) {
    rethrow;
  }
}
