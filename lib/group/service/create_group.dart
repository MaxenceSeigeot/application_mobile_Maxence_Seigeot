import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> createGroup_(
  String gameId,
  String userId,
  String groupName,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Groups')
        .add({"name": groupName});
  } catch (e) {
    rethrow;
  }
}
