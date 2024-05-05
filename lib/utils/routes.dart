import 'package:emergence/group/screen/groups_screen.dart';
import 'package:flutter/material.dart';
import 'package:emergence/game/screen/create_game_screen/create_game_screen.dart';
import 'package:emergence/user/screen/auth_screen.dart';
import 'package:emergence/game/screen/game_screen/games_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/games': (context) => const GamesScreen(),
    '/units': (context) => const GroupsScreen(),
    '/add_game': (context) => const CreateGameScreen(),
    '/auth': (context) => const AuthScreen(),
  };
}
