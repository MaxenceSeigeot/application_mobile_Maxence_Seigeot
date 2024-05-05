import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteGroup_(
  String gameId,
  String userId,
  String groupId,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Groups')
        .doc(groupId)
        .delete();
  } catch (e) {
    rethrow;
  }
}
