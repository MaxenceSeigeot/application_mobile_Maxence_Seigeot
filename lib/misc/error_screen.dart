import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final dynamic error;

  const ErrorScreen(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $error',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
