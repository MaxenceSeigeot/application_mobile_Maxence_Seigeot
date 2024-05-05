import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/unit/model/unit_model.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:emergence/unit/service/create_unit.dart';
import 'package:emergence/unit/service/update_unit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnitService {
  final BuildContext context;

  UnitService(this.context);

  String get gameId =>
      Provider.of<GameProvider>(context, listen: false).selectedGame['id'];

  String get userId =>
      Provider.of<UserProvider>(context, listen: false).userData['userId'];

  Stream<List<Unit>> subscribeAndFetchUnits(String groupId) {
    final unitsQuery = FirebaseFirestore.instance
        .collection('Games')
        .doc(gameId)
        .collection('PlayersData')
        .doc(userId)
        .collection('Units')
        .where('groupId', isEqualTo: groupId);

    return unitsQuery.snapshots().map((unitsSnapshot) {
      return unitsSnapshot.docs.map((unitDoc) {
        return Unit.unitFromDoc(unitDoc);
      }).toList();
    });
  }

  Future<void> createUnit(Unit unit) async {
    await createUnit_(gameId, userId, unit);
  }

  Future<void> updateUnit(String unitId, Unit unit) async {
    await updateUnit_(gameId, userId, unitId, unit);
  }
}
