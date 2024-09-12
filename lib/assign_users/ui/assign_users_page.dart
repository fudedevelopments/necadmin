import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/bloc/getall_bloc.dart';
import 'package:necadmin/assign_users/ui/class_details.dart';
import 'package:necadmin/assign_users/ui/create_class.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/common/errorscreen.dart';
import 'package:necadmin/utils.dart';

class AssignUsersPage extends StatefulWidget {
  const AssignUsersPage({super.key});

  @override
  State<AssignUsersPage> createState() => _AssignUsersPageState();
}

class _AssignUsersPageState extends State<AssignUsersPage> {
  final List<String> classNames = [
    'Math 101',
    'Physics 201',
    'Chemistry 301',
    'Biology 101',
    'History 202',
  ];
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
          title: const Text('User List'),
          backgroundColor: Colors.teal.shade700,
          elevation: 0,
        ),
        body: BlocBuilder<GetallBloc, GetallState>(
          builder: (context, state) {
            if (state is AllclassesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AllclassesSuccessState) {
              return ListView.builder(
                  itemCount: state.classeslist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
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
                      child: GestureDetector(
                        onTap: (){
                          navigationpush(
                            context,
                           ClassDetails(classes: state.classeslist)
                          );
                        },
                        child: ListTile(
                          title: Text(
                            "Class: ${state.classeslist[index].classname}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(15),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is AllclassesfailureState) {
              return const ErrorScreen();
            } else {
              return const ErrorUnkown();
            }
          },
        ));
  }
}
