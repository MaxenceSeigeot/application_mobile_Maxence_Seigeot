import 'package:emergence/group/screen/components/create_group_modal.dart';
import 'package:emergence/group/screen/group_content_column.dart';
import 'package:emergence/stream_snapshot_handler.dart';
import 'package:flutter/material.dart';
import 'package:emergence/group/service/group_service.dart';
import 'package:emergence/group/group_model.dart';

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({Key? key}) : super(key: key);

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  late PageController _pageController;
  final int _currentIndex = 0;
  late GroupService _groupService;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    _groupService = GroupService(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Groups Page'),
      ),
      body: StreamBuilder<List<Group>>(
        stream: _groupService.subscribeAndFetchGroups(),
        builder: (context, snapshot) {
          return StreamSnapshotHandler<List<Group>>(
            snapshot: snapshot,
            dataBuilder: (data) {
              return GroupContentColumn(
                groups: data,
                pageController: _pageController,
                currentIndex: _currentIndex,
                groupService: _groupService,
                context: context,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const CreateGroupModal(),
          );
        },
        tooltip: 'Add Group',
        child: const Icon(Icons.add),
      ),
    );
  }
}
