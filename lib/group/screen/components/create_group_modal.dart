import 'package:flutter/material.dart';
import 'package:emergence/group/service/group_service.dart';

class CreateGroupModal extends StatefulWidget {
  const CreateGroupModal({super.key});

  @override
  _CreateGroupModalState createState() => _CreateGroupModalState();
}

class _CreateGroupModalState extends State<CreateGroupModal> {
  final TextEditingController _groupNameController = TextEditingController();
  late final GroupService _groupService;

  @override
  void initState() {
    super.initState();
    _groupService = GroupService(context);
  }

  @override
  void dispose() {
    _groupNameController.dispose();
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
                const Text('Add Group'),
                const SizedBox(height: 20),
                TextField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(labelText: 'Group Name'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final String groupName = _groupNameController.text;
                    _groupService.createGroup(groupName);
                    Navigator.pop(context);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
