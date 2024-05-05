import 'package:flutter/material.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:provider/provider.dart';

class GamesList extends StatelessWidget {
  final List<Map<String, dynamic>> games;

  const GamesList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: ElevatedButton(
            onPressed: () async {
              final selectedGame = games[index];
              final progressionProvider =
                  Provider.of<GameProvider>(context, listen: false);
              progressionProvider.setSelectedGame(selectedGame);
              Navigator.pushNamed(context, '/units');
            },
            child: Text(games[index]["name"]),
          ),
        );
      },
    );
  }
}
