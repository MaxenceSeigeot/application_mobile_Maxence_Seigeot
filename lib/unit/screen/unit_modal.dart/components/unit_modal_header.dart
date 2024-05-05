import 'package:flutter/material.dart';

class UnitModalHeader extends StatelessWidget {
  final Map<String, TextEditingController> controllers;

  const UnitModalHeader({Key? key, required this.controllers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Unit Name',
              ),
              controller: controllers['name'],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ],
    );
  }
}
