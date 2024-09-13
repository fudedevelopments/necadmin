import 'package:flutter/material.dart';
import 'package:necadmin/assign_users/ui/user_select_screen.dart';
import 'package:necadmin/utils.dart';

class AssignUserToClassRoom extends StatefulWidget {
  const AssignUserToClassRoom({
    super.key,
  });

  @override
  State<AssignUserToClassRoom> createState() => _AssignUserToClassRoomState();
}

class _AssignUserToClassRoomState extends State<AssignUserToClassRoom> {
  String _selectedRole = 'ACADEMIC COORDINATOR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Assign User Role ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              items: ['STUDENTS', 'HOD', 'ACADEMIC COORDINATOR', 'PROCTOR']
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
                navigationpush(context,  UserSelectionScreen(role: _selectedRole,));
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
