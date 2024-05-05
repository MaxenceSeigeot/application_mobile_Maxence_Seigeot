import 'package:emergence/group/screen/components/update_group_modal.dart';
import 'package:emergence/unit/model/unit_model.dart';
import 'package:emergence/unit/screen/unit_modal.dart/unit_modal.dart';
import 'package:flutter/material.dart';
import 'package:emergence/group/group_model.dart';
import 'package:emergence/group/service/group_service.dart';
import 'package:emergence/group/screen/components/delete_group_modal.dart';

class GroupContentColumn extends StatelessWidget {
  final List<Group> groups;
  final PageController pageController;
  final int currentIndex;
  final BuildContext context;
  final GroupService groupService;

  const GroupContentColumn({
    required this.groups,
    required this.pageController,
    required this.currentIndex,
    required this.context,
    required this.groupService,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: groups.length,
            onPageChanged: (index) {},
            itemBuilder: (context, index) {
              final group = groups[index];
              return _buildGroupWidget(
                  group,
                  groups.map((group) => group.id).toList(),
                  groups.map((group) => group.name).toList());
            },
          ),
        ),
        _buildIndicatorBar(groups.length),
      ],
    );
  }

  Widget _buildGroupWidget(
      Group group, List<String> groupIds, List<String> groupNames) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            group.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => UpdateGroupModal(
                      groupId: group.id,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteGroupModal(
                      groupId: group.id,
                      groupName: group.name,
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => UnitModal(
                        unit: newUnit,
                        groupIds: groupIds,
                        groupNames: groupNames),
                  );
                },
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: group.units.map((unit) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => UnitModal(
                        unit: unit, groupIds: groupIds, groupNames: groupNames),
                  );
                },
                child: Text(unit.name),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildIndicatorBar(int pageCount) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pageCount,
        itemBuilder: (context, index) {
          return Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? Colors.blue : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}
