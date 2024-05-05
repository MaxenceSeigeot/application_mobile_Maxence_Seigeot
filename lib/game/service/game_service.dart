import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergence/game/service/create_game_service.dart';
import 'package:emergence/game/service/fetch_user_games_service.dart';

class GameService {
  final BuildContext context;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  GameService(this.context);

  String get gameId =>
      Provider.of<GameProvider>(context, listen: false).selectedGame['id'];

  String get userId =>
      Provider.of<UserProvider>(context, listen: false).userData['userId'];

  Future<void> createGame(String name, List<String> userIds) async {
    await createGame_(context, firestore, name, userIds);
  }

  Stream<List<Map<String, String>>> fetchUserGames(String userId) {
    return fetchUserGames_(firestore, userId);
  }
}
