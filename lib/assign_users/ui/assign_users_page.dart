import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/getallclass/getall_bloc.dart';
import 'package:necadmin/assign_users/ui/class_details.dart';
import 'package:necadmin/assign_users/ui/create_class.dart';
import 'package:necadmin/common/empty_page.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/common/errorscreen.dart';
import 'package:necadmin/utils.dart';

class AssignUsersPage extends StatefulWidget {
  const AssignUsersPage({super.key});

  @override
  State<AssignUsersPage> createState() => _AssignUsersPageState();
}

class _AssignUsersPageState extends State<AssignUsersPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetallBloc>(context).add(AllClassevent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationpush(context, const CreateClassScreen());
          },
          tooltip: "Create class",
          child: const Icon(Icons.class_),
        ),
        appBar: AppBar(
          title: const Text('Class rooms & Assign users'),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetallBloc, GetallState>(
                builder: (context, state) {
                  if (state is AllclassesLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is AllclassesSuccessState) {
                    return ListView.builder(
                        itemCount: state.classroomlist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.shade300,
                                  Colors.green[300]!,
                                ],
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
                            child: GestureDetector(
                              onTap: () {
                                navigationpush(
                                    context,
                                    ClassDetails(
                                        classRoom: state.classroomlist[index]));
                              },
                              child: ListTile(
                                title: Text(
                                  "Class: ${state.classroomlist[index].classRoomname}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                          );
                        });
                  }
                  if (state is AllclassesEmptyState) {
                    return const EmptyPage(
                      message: "No Class Room Data Available",
                    );
                  }
                  if (state is AllclassesfailureState) {
                    return const ErrorScreen();
                  } else {
                    return const ErrorUnkown();
                  }
                },
              ),
            ],
          ),
        ));
  }
}
