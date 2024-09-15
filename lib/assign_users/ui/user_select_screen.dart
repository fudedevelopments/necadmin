// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/assignbloc/assign_bloc.dart';
import 'package:necadmin/assign_users/ui/status_page.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/manageUser/listusersbloc/listuser_bloc.dart';
import 'package:necadmin/model/staffmodel.dart';
import 'package:necadmin/model/students.dart';
import 'package:necadmin/models/ClassRoom.dart';
import 'package:necadmin/utils.dart';

class UserSelectionScreen extends StatefulWidget {
  final ClassRoom classRoom;
  final String role;
  const UserSelectionScreen({
    super.key,
    required this.classRoom,
    required this.role,
  });

  @override
  // ignore: library_private_types_in_public_api
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  List selectedUsers = [];
  List filteredUsers = [];
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListuserBloc, ListuserState>(
      builder: (context, state) {
        if (state is ListAllGroupUsersSuccessState) {
          List<Studentsmodel> studentmodels = state.allmodels[0];
          List<StaffModel> staffmodels = state.allmodels[1];
          if (filteredUsers.isEmpty) {
            filteredUsers =
                widget.role == "STUDENTS" ? studentmodels : staffmodels;
          }
          void addUser() {
            if (selectedUsers.isNotEmpty) {
              BlocProvider.of<AssignBloc>(context).add(AddUserToClassRoomEvent(
                  users: selectedUsers,
                  classRoom: widget.classRoom,
                  role: widget.role));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('No users selected!'),
              ));
            }
          }

          void filterUsers(String query) {
            setState(() {
              searchQuery = query;
              if (widget.role == "STUDENTS") {
                filteredUsers = studentmodels
                    .where((student) => student.email
                        .toLowerCase()
                        .contains(query.toLowerCase()))
                    .toList();
              } else {
                filteredUsers = staffmodels
                    .where((staff) =>
                        staff.email.toLowerCase().contains(query.toLowerCase()))
                    .toList();
              }
            });
          }

          void toggleSelection(dynamic user) {
            setState(() {
              if (selectedUsers.contains(user)) {
                selectedUsers.remove(user);
              } else {
                selectedUsers.add(user);
              }
            });
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('User Selection'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search Users',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: filterUsers,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Assign user as : ${widget.role}"),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text(user.sub),
                        trailing: Checkbox(
                          value: selectedUsers.contains(user),
                          onChanged: (bool? value) {
                            toggleSelection(user);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<AssignBloc, AssignState>(
                      listener: (context, state) {
                        if (state is AssignUserSuccessState) {
                          navigationpush(
                              context, UserStatusPage(
                                result: state.result,
                                users: selectedUsers,
                                classRoom: widget.classRoom,
                                ));
                        }
                      },
                      builder: (context, state) {
                        if (state is AssignUserLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return TextButton(
                            onPressed: addUser,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                              backgroundColor: Colors.blue,
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            child: const Text('Add User'),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const ErrorUnkown();
        }
      },
    );
  }
}
