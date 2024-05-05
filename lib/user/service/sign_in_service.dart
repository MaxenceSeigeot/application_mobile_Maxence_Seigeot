import 'package:emergence/user/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> signIn_(
    BuildContext context,
    FirebaseAuth auth,
    TextEditingController emailController,
    TextEditingController passwordController) async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  if (email.isNotEmpty && password.isNotEmpty) {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        Map<String, dynamic> credentialMap = {'userId': credential.user?.uid};
        userProvider.setUserData(credentialMap);
        Navigator.pushNamed(context, '/games');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to sign in, please try again.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred, please try again.'),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please fill in all fields.')),
    );
  }
}
