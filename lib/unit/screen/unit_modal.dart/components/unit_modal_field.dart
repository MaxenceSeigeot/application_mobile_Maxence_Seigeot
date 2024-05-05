import 'package:flutter/material.dart';
import 'package:emergence/unit/model/unit_model.dart';

class UnitModalFields extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final Unit unit;

  const UnitModalFields({
    Key? key,
    required this.controllers,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: _buildTextField('apt', 'Apt'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField('wounded', 'Wounded'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField('dead', 'Dead'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildReadOnlyField('size', 'Size'),
              ),
            ],
          ),
        ),
        ...unit
            .toMap()
            .keys
            .where((key) =>
                key != 'id' &&
                key != 'name' &&
                key != 'apt' &&
                key != 'wounded' &&
                key != 'dead' &&
                key != 'size' &&
                key != 'groupId' &&
                key != 'deadRatio')
            .map((key) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: key,
                    ),
                    controller: controllers[key],
                    keyboardType: TextInputType.text,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTextField(String key, String labelText) {
    final controller = controllers[key] ?? TextEditingController();
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }

  Widget _buildReadOnlyField(String key, String labelText) {
    final controller = controllers[key] ?? TextEditingController();
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      readOnly: true,
    );
  }
}
