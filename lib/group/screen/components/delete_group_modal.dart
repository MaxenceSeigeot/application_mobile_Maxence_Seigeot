import 'package:flutter/material.dart';
import 'package:emergence/group/service/group_service.dart';

class DeleteGroupModal extends StatefulWidget {
  final String groupId;
  final String groupName;

  const DeleteGroupModal({
    super.key,
    required this.groupId,
    required this.groupName,
  });

  @override
  _DeleteGroupModalState createState() => _DeleteGroupModalState();
}

class _DeleteGroupModalState extends State<DeleteGroupModal> {
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
                Text('Supprimer "${widget.groupName}"'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _groupService.deleteGroup(widget.groupId);
                    Navigator.pop(context);
                  },
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
