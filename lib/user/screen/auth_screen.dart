import 'package:emergence/user/screen/components/sign_in_screen.dart';
import 'package:emergence/user/screen/components/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Authentification'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Se connecter'),
              Tab(text: "S'inscrire"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SignInScreen(),
            SignUpScreen(),
          ],
        ),
      ),
    );
  }
}
