import 'package:emergence/game/screen/game_screen/components/games_list.dart';
import 'package:flutter/material.dart';
import 'package:emergence/game/service/game_service.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:provider/provider.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameService gameService = GameService(context);
    final userProvider = Provider.of<UserProvider>(context);
    final String userId = userProvider.userData['userId'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: gameService.fetchUserGames(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Map<String, dynamic>> games = snapshot.data ?? [];
            return GamesList(games: games);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_game');
        },
        tooltip: 'Add Game',
        child: const Icon(Icons.add),
      ),
    );
  }
}
