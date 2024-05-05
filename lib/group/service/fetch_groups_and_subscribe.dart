import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/group/group_model.dart';
import 'package:emergence/unit/model/unit_model.dart';

Stream<List<Group>> subscribeAndFetchGroups_(
  String gameId,
  String userId,
) {
  final groupsQuery = FirebaseFirestore.instance
      .collection('Games')
      .doc(gameId)
      .collection('PlayersData')
      .doc(userId)
      .collection('Groups');

  return groupsQuery.snapshots().asyncMap((groupsSnapshot) async {
    final groups = <Group>[];
    for (var groupDoc in groupsSnapshot.docs) {
      final group = Group(
        id: groupDoc.id,
        name: groupDoc['name'],
        units: [],
      );

      final unitsQuery = FirebaseFirestore.instance
          .collection('Games')
          .doc(gameId)
          .collection('PlayersData')
          .doc(userId)
          .collection('Units')
          .where('groupId', isEqualTo: groupDoc.id);

      final unitsSnapshot = await unitsQuery.get();
      group.units = unitsSnapshot.docs.map((unitDoc) {
        return Unit.unitFromDoc(unitDoc);
      }).toList();

      unitsQuery.snapshots().listen((unitsSnapshot) {
        group.units = unitsSnapshot.docs.map((unitDoc) {
          return Unit.unitFromDoc(unitDoc);
        }).toList();
      });

      groups.add(group);
    }
    return groups;
  });
}
