import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> createGame_(BuildContext context, FirebaseFirestore firestore,
    String name, List<String> userIds) async {
  try {
    final docRef = await firestore.collection('Games').add({
      'name': name,
      'players': userIds,
    });

    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    Map<String, dynamic> selectedGame = {
      'id': docRef.id,
      'name': name,
    };
    gameProvider.setSelectedGame(selectedGame);
    Navigator.pushNamed(context, '/units');
  } catch (e) {
    throw Exception('Error creating game: $e');
  }
}
