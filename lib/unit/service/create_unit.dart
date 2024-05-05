import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/unit/model/unit_model.dart';

Future<void> createUnit_(
  String gameId,
  String userId,
  Unit unit,
) async {
  try {
    await FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Units')
        .add(unit.toMap());
  } catch (e) {
    rethrow;
  }
}
