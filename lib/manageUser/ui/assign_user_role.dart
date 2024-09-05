// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:necadmin/manageUser/adduserbloc/manageuser_bloc.dart';
import 'package:necadmin/manageUser/ui/manageusers.dart';
import 'package:necadmin/utils.dart';

class AssignUserRole extends StatefulWidget {
  final String userId;
  const AssignUserRole({
    super.key,
    required this.userId,
  });

  @override
  State<AssignUserRole> createState() => _AssignUserRoleState();
}

class _AssignUserRoleState extends State<AssignUserRole> {
  String _selectedRole = 'STUDENTS';
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
              items: ['STUDENTS', 'STAFF'].map((String role) {
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
            BlocConsumer<ManageuserBloc, ManageuserState>(
              listener: (context, state) {
                if (state is AddusertoGroupSucessState) {
                  showsnakbar(context, "Successfully assigned the group");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const UserList()),
                      (route) => false);
                }
                if (state is AddusertoGroupFailureState) {
                  showsnakbar(context, "Failed to assign group");
                }
              },
              builder: (context, state) {
                if (state is AddusertoGroupLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ManageuserBloc>(context).add(
                            AdduserToGroup(
                                role: _selectedRole, userId: widget.userId));
                      },
                      child: const Text("Assign user"));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
