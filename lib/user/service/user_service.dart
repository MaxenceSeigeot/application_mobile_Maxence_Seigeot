import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergence/user/service/sign_in_service.dart';
import 'package:emergence/user/service/sign_up_service.dart';
import 'package:emergence/user/service/fetch_users_service.dart';

class UserService {
  final BuildContext context;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserService(this.context);

  String get gameId =>
      Provider.of<GameProvider>(context, listen: false).selectedGame['id'];

  String get userId =>
      Provider.of<UserProvider>(context, listen: false).userData['userId'];

  Future<void> signIn(TextEditingController emailController,
      TextEditingController passwordController) async {
    await signIn_(context, auth, emailController, passwordController);
  }

  Future<void> signUp(TextEditingController emailController,
      TextEditingController passwordController) async {
    await signUp_(
        context, auth, firestore, emailController, passwordController);
  }

  Future<void> fetchUsers() async {
    await fetchUsers_(firestore);
  }
}
