class Game {
  final String? id;
  final String name;
  final List<String> userIds;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userIds': userIds,
    };
  }

  Game({this.id, required this.name, required this.userIds});
}
