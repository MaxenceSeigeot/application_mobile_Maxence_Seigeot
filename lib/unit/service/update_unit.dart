import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/unit/model/unit_model.dart';

Future<void> updateUnit_(
  String gameId,
  String userId,
  String unitId,
  Unit unit,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Units')
        .doc(unitId)
        .update(unit.toMap());
  } catch (e) {
    rethrow;
  }
}
