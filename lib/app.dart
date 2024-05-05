import 'package:emergence/game/provider/game_provider.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:emergence/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => UserProvider()),
              ChangeNotifierProvider(create: (context) => GameProvider()),
            ],
            child: MaterialApp(
              title: 'Emergence',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute: '/auth',
              routes: Routes.routes,
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
