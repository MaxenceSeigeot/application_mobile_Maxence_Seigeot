import 'package:emergence/group/service/delete_group.dart';
import 'package:emergence/group/service/update_group.dart';
import 'package:emergence/group/group_model.dart';
import 'package:emergence/game/provider/game_provider.dart';
import 'package:emergence/user/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:emergence/group/service/create_group.dart';
import 'package:emergence/group/service/fetch_groups_and_subscribe.dart';

class GroupService {
  final BuildContext context;

  GroupService(this.context);

  String get gameId =>
      Provider.of<GameProvider>(context, listen: false).selectedGame['id'];

  String get userId =>
      Provider.of<UserProvider>(context, listen: false).userData['userId'];

  Future<void> createGroup(String groupName) async {
    await createGroup_(gameId, userId, groupName);
  }

  Stream<List<Group>> subscribeAndFetchGroups() {
    return subscribeAndFetchGroups_(gameId, userId);
  }

  Future<void> updateGroup(String groupId, GroupDB group) async {
    await updateGroup_(gameId, userId, groupId, group);
  }

  Future<void> deleteGroup(String groupId) async {
    await deleteGroup_(gameId, userId, groupId);
  }
}
