import 'package:cloud_firestore/cloud_firestore.dart';

class Unit {
  final String id;
  final String name;
  final String groupId;
  final String armyId;
  final String commander;
  final String characters;
  final String renown;
  final String story;
  final String formations;
  final int size;
  final int apt;
  final int wounded;
  final int dead;
  final int strMnvr;
  final int tactMnvr;
  final int meleeAtk;
  final int rangeAtk;
  final int spAtk;
  final int machineAtk;
  final int deploy;
  final int craft;
  final int disc;
  final int moral;
  final int armor;
  final int ap;
  final int deadRatio;

  Unit({
    required this.id,
    required this.name,
    required this.groupId,
    required this.armyId,
    required this.commander,
    required this.characters,
    required this.renown,
    required this.story,
    required this.formations,
    required this.size,
    required this.apt,
    required this.wounded,
    required this.dead,
    required this.strMnvr,
    required this.tactMnvr,
    required this.meleeAtk,
    required this.rangeAtk,
    required this.spAtk,
    required this.machineAtk,
    required this.deploy,
    required this.craft,
    required this.disc,
    required this.moral,
    required this.armor,
    required this.ap,
    required this.deadRatio,
  });

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      groupId: map['groupId'] ?? '',
      armyId: map['armyId'] ?? '',
      commander: map['commander'] ?? '',
      characters: map['characters'] ?? '',
      renown: map['renown'] ?? '',
      story: map['story'] ?? '',
      formations: map['formations'] ?? '',
      size: map['apt'] + map['wounded'] + map['dead'] ?? 0,
      apt: map['apt'] ?? 0,
      wounded: map['wounded'] ?? 0,
      dead: map['dead'] ?? 0,
      strMnvr: map['strMnvr'] ?? 0,
      tactMnvr: map['tactMnvr'] ?? 0,
      meleeAtk: map['meleeAtk'] ?? 0,
      rangeAtk: map['rangeAtk'] ?? 0,
      spAtk: map['spAtk'] ?? 0,
      machineAtk: map['machineAtk'] ?? 0,
      deploy: map['deploy'] ?? 0,
      craft: map['craft'] ?? 0,
      disc: map['disc'] ?? 0,
      moral: map['moral'] ?? 0,
      armor: map['armor'] ?? 0,
      ap: map['ap'] ?? 0,
      deadRatio: map['deadRatio'] ?? 0.0,
    );
  }

  static Unit unitFromDoc(DocumentSnapshot unitDoc) {
    return Unit(
      id: unitDoc.id,
      name: unitDoc['name'],
      groupId: unitDoc['groupId'],
      armyId: "",
      commander: unitDoc['commander'],
      characters: unitDoc['characters'],
      renown: unitDoc['renown'],
      story: unitDoc['story'],
      formations: unitDoc['formations'],
      size: unitDoc['size'].toInt(),
      apt: unitDoc['apt'].toInt(),
      wounded: unitDoc['wounded'].toInt(),
      dead: unitDoc['dead'].toInt(),
      strMnvr: unitDoc['strMnvr'].toInt(),
      tactMnvr: unitDoc['tactMnvr'].toInt(),
      meleeAtk: unitDoc['meleeAtk'].toInt(),
      rangeAtk: unitDoc['rangeAtk'].toInt(),
      spAtk: unitDoc['spAtk'].toInt(),
      machineAtk: unitDoc['machineAtk'].toInt(),
      deploy: unitDoc['deploy'].toInt(),
      craft: unitDoc['craft'].toInt(),
      disc: unitDoc['disc'].toInt(),
      moral: unitDoc['moral'].toInt(),
      armor: unitDoc['armor'].toInt(),
      ap: unitDoc['ap'].toInt(),
      deadRatio: unitDoc['deadRatio'].toInt(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'groupId': groupId,
      'armyId': armyId,
      'commander': commander,
      'characters': characters,
      'renown': renown,
      'story': story,
      'formations': formations,
      'size': size,
      'apt': apt,
      'wounded': wounded,
      'dead': dead,
      'strMnvr': strMnvr,
      'tactMnvr': tactMnvr,
      'meleeAtk': meleeAtk,
      'rangeAtk': rangeAtk,
      'spAtk': spAtk,
      'machineAtk': machineAtk,
      'deploy': deploy,
      'craft': craft,
      'disc': disc,
      'moral': moral,
      'armor': armor,
      'ap': ap,
      'deadRatio': deadRatio,
    };
  }
}

final newUnit = Unit(
  id: '',
  name: '',
  groupId: '',
  armyId: '',
  commander: '',
  characters: '',
  renown: '',
  story: '',
  formations: '',
  size: 0,
  apt: 0,
  wounded: 0,
  dead: 0,
  strMnvr: 0,
  tactMnvr: 0,
  meleeAtk: 0,
  rangeAtk: 0,
  spAtk: 0,
  machineAtk: 0,
  deploy: 0,
  craft: 0,
  disc: 0,
  moral: 0,
  armor: 0,
  ap: 0,
  deadRatio: 0,
);
