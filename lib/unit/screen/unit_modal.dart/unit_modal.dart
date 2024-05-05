import 'package:flutter/material.dart';
import 'package:emergence/unit/service/unit_service.dart';
import 'package:emergence/unit/model/unit_model.dart';
import 'package:emergence/unit/screen/unit_modal.dart/components/unit_modal_field.dart';
import 'package:emergence/unit/screen/unit_modal.dart/components/unit_modal_header.dart';
import 'package:emergence/unit/screen/unit_modal.dart/components/unit_modal_validation.dart';

class UnitModal extends StatefulWidget {
  final Unit unit;
  final List<String> groupIds;
  final List<String> groupNames;

  const UnitModal({
    super.key,
    required this.unit,
    required this.groupIds,
    required this.groupNames,
  });

  @override
  _UnitModalState createState() => _UnitModalState();
}

class _UnitModalState extends State<UnitModal> {
  late UnitService unitService;
  late Map<String, TextEditingController> _controllers;
  String? _selectedGroupId;

  @override
  void initState() {
    super.initState();
    unitService = UnitService(context);
    _controllers = {};
    widget.unit.toMap().forEach((key, value) {
      _controllers[key] = TextEditingController(text: value.toString());

      if (key == 'apt' || key == 'wounded' || key == 'dead') {
        _controllers[key]!.addListener(() {
          final int apt = int.tryParse(_controllers['apt']!.text) ?? 0;
          final int wounded = int.tryParse(_controllers['wounded']!.text) ?? 0;
          final int dead = int.tryParse(_controllers['dead']!.text) ?? 0;
          final int size = apt + wounded + dead;
          _controllers['size']!.text = size.toString();
        });
      }
    });

    if (widget.unit.groupId.isNotEmpty) {
      _selectedGroupId = widget.unit.groupId;
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UnitModalHeader(controllers: _controllers),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Group',
                      border: OutlineInputBorder(),
                    ),
                    value: _selectedGroupId,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedGroupId = newValue;
                      });
                    },
                    items: widget.groupIds.map((groupId) {
                      final index = widget.groupIds.indexOf(groupId);
                      final groupName = widget.groupNames[index];
                      return DropdownMenuItem<String>(
                        value: groupId,
                        child: Text(groupName),
                      );
                    }).toList(),
                  ),
                ),
                UnitModalFields(controllers: _controllers, unit: widget.unit),
                UnitModalValidationButton(
                    validateAndSaveUnit: _validateAndSaveUnit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateAndSaveUnit() {
    final Map<String, dynamic> allData = {
      ..._controllers.map((key, controller) => MapEntry(key, controller.text)),
      'groupId': _selectedGroupId ?? '',
    };

    final Map<String, int> intFields = {};
    final List<String> intFieldNames = [
      'size',
      'apt',
      'wounded',
      'dead',
      'strMnvr',
      'tactMnvr',
      'meleeAtk',
      'rangeAtk',
      'spAtk',
      'machineAtk',
      'deploy',
      'craft',
      'disc',
      'moral',
      'armor',
      'ap',
      'deadRatio',
    ];

    intFieldNames.forEach((fieldName) {
      final value = allData[fieldName];
      if (value != null && value.isNotEmpty) {
        intFields[fieldName] = int.tryParse(value) ?? 0;
      }
    });

    final int size =
        intFields['apt']! + intFields['wounded']! + intFields['dead']!;
    intFields['size'] = size;

    intFields.forEach((fieldName, value) {
      allData[fieldName] = value;
    });

    try {
      final Unit unit = Unit.fromMap(allData);

      if (widget.unit.id.isEmpty) {
        unitService.createUnit(unit);
      } else {
        unitService.updateUnit(unit.id, unit);
      }
      Navigator.pop(context);
    } catch (e) {
      rethrow;
    }
  }
}
