import 'package:emergence/game/service/game_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateGameScreen extends StatefulWidget {
  const CreateGameScreen({super.key});

  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _gameNameController = TextEditingController();
  final List<String> _selectedUsers = [];

  @override
  Widget build(BuildContext context) {
    final GameService gameService = GameService(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Create Game'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _gameNameController,
                  decoration: const InputDecoration(labelText: 'Game Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a game name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                const Text('Select Users:'),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children:
                            snapshot.data!.docs.map((DocumentSnapshot doc) {
                          String userId = doc.id;
                          String userName = doc['username'];
                          return CheckboxListTile(
                            title: Text(userName),
                            value: _selectedUsers.contains(userId),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedUsers.add(userId);
                                } else {
                                  _selectedUsers.remove(userId);
                                }
                              });
                            },
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      String gameName = _gameNameController.text;
                      await gameService.createGame(gameName, _selectedUsers);
                    }
                  },
                  child: const Text('Create Game'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
