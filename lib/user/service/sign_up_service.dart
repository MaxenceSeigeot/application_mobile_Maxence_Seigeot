import 'package:emergence/user/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> signUp_(
    BuildContext context,
    FirebaseAuth auth,
    FirebaseFirestore firestore,
    TextEditingController emailController,
    TextEditingController passwordController) async {
  String email = emailController.text.trim();
  String password = passwordController.text.trim();

  try {
    if (email.isNotEmpty && password.isNotEmpty) {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await firestore
            .collection('Users')
            .doc(credential.user?.uid)
            .set({"faction": '', 'username': email});

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        Map<String, dynamic> userDataMap = {'userId': credential.user?.uid};
        userProvider.setUserData(userDataMap);
        Navigator.pushNamed(context, '/games');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up failed. Please try again.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
    }
  } catch (error) {
    rethrow;
  }
}
