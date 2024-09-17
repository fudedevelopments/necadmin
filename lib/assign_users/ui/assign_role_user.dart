// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:necadmin/assign_users/ui/user_select_screen.dart';
import 'package:necadmin/models/ClassRoom.dart';
import 'package:necadmin/utils.dart';

class AssignUserToClassRoom extends StatefulWidget {
  final ClassRoom classRoom;
  const AssignUserToClassRoom({
    super.key,
    required this.classRoom,
  });

  @override
  State<AssignUserToClassRoom> createState() => _AssignUserToClassRoomState();
}

class _AssignUserToClassRoomState extends State<AssignUserToClassRoom> {
  String _selectedRole = 'ACADEMIC COORDINATOR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select user Role'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF66BB6A),
                Color(0xFF43A047),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text(
              "Choose User Role for ${widget.classRoom.classRoomname}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: InputDecoration(
                labelText: 'Role',
                labelStyle: TextStyle(color: Colors.teal.shade900),
                filled: true,
                fillColor: Colors.teal.shade50,
                prefixIcon: Icon(Icons.person, color: Colors.teal.shade700),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.teal.shade100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.teal.shade700),
                ),
              ),
              dropdownColor: Colors.teal.shade50,
              items: ['HOD', 'ACADEMIC COORDINATOR', 'PROCTOR']
                  .map((String role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                navigationpush(
                    context,
                    UserSelectionScreen(
                      classRoom: widget.classRoom,
                      role: _selectedRole,
                    ));
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
              child: const Text("Proceed to select user"),
            )
          ],
        ),
      ),
    );
  }
}
