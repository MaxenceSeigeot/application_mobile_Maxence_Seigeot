import 'package:emergence/group/group_model.dart';
import 'package:flutter/material.dart';
import 'package:emergence/group/service/group_service.dart';

class UpdateGroupModal extends StatefulWidget {
  final String groupId;

  const UpdateGroupModal({
    super.key,
    required this.groupId,
  });

  @override
  _UpdateGroupModalState createState() => _UpdateGroupModalState();
}

class _UpdateGroupModalState extends State<UpdateGroupModal> {
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
                    final GroupDB group = GroupDB(
                      id: widget.groupId,
                      name: _groupNameController.text,
                    );
                    _groupService.updateGroup(widget.groupId, group);
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
