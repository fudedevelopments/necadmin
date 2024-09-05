import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/common/errorscreen.dart';
import 'package:necadmin/manageUser/listusersbloc/listuser_bloc.dart';
import 'package:necadmin/manageUser/ui/create_user.dart';
import 'package:necadmin/model/staffmodel.dart';
import 'package:necadmin/model/students.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  bool _showStudents = true;

  final List<Map<String, String>> _students = [
    {'name': 'John Doe', 'email': 'john.doe@student.com'},
    {'name': 'Jane Smith', 'email': 'jane.smith@student.com'},
    {'name': 'Michael Brown', 'email': 'michael.brown@student.com'},
  ];

  final List<Map<String, String>> _staff = [
    {'name': 'Emily Clark', 'email': 'emily.clark@staff.com'},
    {'name': 'David Johnson', 'email': 'david.johnson@staff.com'},
    {'name': 'Laura Wilson', 'email': 'laura.wilson@staff.com'},
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListuserBloc>(context).add(ListGroupUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserForm()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
      ),
      body: BlocBuilder<ListuserBloc, ListuserState>(
        builder: (context, state) {
          if (state is ListAllGroupUsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ListAllGroupUsersFailureState) {
            return const ErrorScreen();
          }
          if (state is ListAllGroupUsersSuccessState) {
            final List<Studentsmodel> students = state.allmodels[0];
            final List<StaffModel> staff = state.allmodels[1];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: _showStudents
                              ? Colors.teal.shade600
                              : Colors.teal.shade200,
                        ),
                        onPressed: () {
                          setState(() {
                            _showStudents = true;
                          });
                        },
                        child: const Text('Students'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: !_showStudents
                              ? Colors.teal.shade600
                              : Colors.teal.shade200,
                        ),
                        onPressed: () {
                          setState(() {
                            _showStudents = false;
                          });
                        },
                        child: const Text('Staff'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: _showStudents ? students.length : staff.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal.shade100,
                            child: Icon(
                              Icons.person,
                              color: Colors.teal.shade700,
                            ),
                          ),
                          title: Text(
                            _showStudents ? students[index].name : staff[index].name ,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          subtitle: Text(
                              _showStudents ? students[index].email : staff[index].email ,
                            style: TextStyle(
                              color: Colors.teal.shade700,
                            ),
                          ),
                          trailing: IconButton(
                            icon:
                                Icon(Icons.delete, color: Colors.teal.shade600),
                            onPressed: () {
                              setState(() {
                                if (_showStudents) {
                                  _students.removeAt(index);
                                } else {
                                  _staff.removeAt(index);
                                }
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const ErrorUnkown();
          }
        },
      ),
    );
  }
}
