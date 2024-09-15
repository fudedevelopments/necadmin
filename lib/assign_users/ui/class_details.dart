import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/assignbloc/assign_bloc.dart';
import 'package:necadmin/assign_users/bloc/classroom_bloc.dart';
import 'package:necadmin/assign_users/ui/assign_role_user.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/common/errorscreen.dart';
import 'package:necadmin/landing_page/ui/landing_page.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class ClassDetails extends StatefulWidget {
  final ClassRoom classRoom;
  const ClassDetails({
    super.key,
    required this.classRoom,
  });

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClassroomBloc>(context)
        .add(GetallClassroomUsers(classroomid: widget.classRoom.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classRoom.classRoomname!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationpush(
              context,
              AssignUserToClassRoom(
                classRoom: widget.classRoom,
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<AssignBloc, AssignState>(
        listener: (context, state) {
          if (state is DeleteClassRoomloadingState) {
            showLoadingDialog(context);
          }
          if (state is DeleteClassRoomSuccessState) {
            navigatorpushandremove(context, const LandingPage());
            showsnakbar(context, "Class room deleted");
          }
          if (state is DeleteUserLoadingState) {
            showLoadingDialog(context);
          }
          if (state is DeleteUserSucessState) {
            BlocProvider.of<ClassroomBloc>(context)
                .add(GetallClassroomUsers(classroomid: widget.classRoom.id));
            showsnakbar(context, "User Deleted SuccessFully");
            pop(context);
          }
        },
        builder: (context, state) {
          return BlocBuilder<ClassroomBloc, ClassroomState>(
            builder: (context, state) {
              if (state is GetAllClassRoomUsersSuccessState) {
                return ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    if (state.hodlist.isEmpty)
                      Center(
                        child: Text(
                          'No HOD users can be assigned',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                    else
                      ...state.hodlist.map((hods) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green[300]!, Colors.green[600]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                              title: const Text(
                                'HOD',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(hods.hodname!,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  Text(hods.email!,
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                              leading:
                                  const Icon(Icons.person, color: Colors.white),
                              trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirm Deletion'),
                                        content: const Text(
                                            'Are you sure you want to delete this item?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              BlocProvider.of<AssignBloc>(
                                                      context)
                                                  .add(DeleteClassRoomUser(
                                                      userid: hods.id,
                                                      role: "HOD"));
                                            },
                                            child: const Text(
                                              'Delete',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),
                                color: Colors.red,
                              )),
                        );
                      }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Academic Coordinators',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    if (state.aclist.isEmpty)
                      Center(
                        child: Text(
                          'No Academic Coordinators can be assigned',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                    else
                      ...state.aclist.map((acs) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green[100]!, Colors.green[300]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              acs.email!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading:
                                const Icon(Icons.school, color: Colors.green),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Deletion'),
                                      content: const Text(
                                          'Are you sure you want to delete this item?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Dismiss the dialog without any action
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            BlocProvider.of<AssignBloc>(context)
                                                .add(DeleteClassRoomUser(
                                                    userid: acs.id,
                                                    role:
                                                        "ACADEMIC COORDINATOR"));
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ),
                        );
                      }),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Proctors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green[800],
                        ),
                      ),
                    ),
                    if (state.proctorlist.isEmpty)
                      Center(
                        child: Text(
                          'No Proctors can be assigned',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                    else
                      ...state.proctorlist.map((proctor) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.green[100]!, Colors.green[300]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              proctor.email!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading:
                                const Icon(Icons.security, color: Colors.green),
                            trailing: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Deletion'),
                                      content: const Text(
                                          'Are you sure you want to delete this item?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            BlocProvider.of<AssignBloc>(context)
                                                .add(DeleteClassRoomUser(
                                                    userid: proctor.id,
                                                    role: "PROCTOR"));
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                          ),
                        );
                      }),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if there are any users in the class (HODs, ACs, or Proctors)
                          if (state.hodlist.isNotEmpty ||
                              state.aclist.isNotEmpty ||
                              state.proctorlist.isNotEmpty) {
                            // Show a dialog box prompting the user to delete all users first
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Cannot Delete Classroom'),
                                  content: const Text(
                                    'Please delete all users (HODs, Academic Coordinators, and Proctors) before deleting the classroom.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Confirm Deletion'),
                                  content: const Text(
                                    'Are you sure you want to delete this classroom?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        BlocProvider.of<AssignBloc>(context)
                                            .add(
                                          DeleteClassRoom(
                                              classRoom: widget.classRoom),
                                        );
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                        child: const Text("Delete Class"),
                      ),
                    )
                  ],
                );
              }
              if (state is GetAllClassRoomUsersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetAllClassRoomUsersFailureState) {
                return const ErrorScreen();
              } else {
                return const ErrorUnkown();
              }
            },
          );
        },
      ),
    );
  }
}
