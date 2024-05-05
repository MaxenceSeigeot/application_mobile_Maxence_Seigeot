import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/group/group_model.dart';

Future<void> updateGroup_(
  String gameId,
  String userId,
  String groupId,
  GroupDB group,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Groups')
        .doc(groupId)
        .update(group.toMap());
  } catch (e) {
    rethrow;
  }
}
