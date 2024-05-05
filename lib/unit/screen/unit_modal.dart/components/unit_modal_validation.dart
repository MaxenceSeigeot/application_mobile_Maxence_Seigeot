import 'package:flutter/material.dart';

class UnitModalValidationButton extends StatelessWidget {
  final Function() validateAndSaveUnit;

  const UnitModalValidationButton({Key? key, required this.validateAndSaveUnit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: validateAndSaveUnit,
      child: const Text('Validate'),
    );
  }
}
