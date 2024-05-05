import 'package:emergence/unit/model/unit_model.dart';

class GroupDB {
  final String id;
  final String name;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  GroupDB({required this.id, required this.name});
}

class Group extends GroupDB {
  List<Unit> units;

  Group({
    required super.id,
    required super.name,
    required this.units,
  });
}
