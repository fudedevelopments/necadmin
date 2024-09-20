// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/bloc/proctor_bloc.dart';
import 'package:necadmin/assign_users/ui/students/add_students_under_proctor.dart';
import 'package:necadmin/common/empty_page.dart';
import 'package:necadmin/common/error_unknown.dart';
import 'package:necadmin/common/errorscreen.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class StudentsIntheProctor extends StatefulWidget {
  final List<Student> students;
  final Proctor proctor;
  const StudentsIntheProctor({
    super.key,
    required this.students,
    required this.proctor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _StudentsIntheProctorState createState() => _StudentsIntheProctorState();
}

class _StudentsIntheProctorState extends State<StudentsIntheProctor> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProctorBloc>(context)
        .add(GetAllProctorsStudents(proctor: widget.proctor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List Under proctor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProctorBloc, ProctorState>(
          builder: (context, state) {
            if (state is GetAllProctorsStudentsSuccessState) {
              return SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    final student = state.students[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        title: Text(
                          student.studentname!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
                            Text('Email: ${student.email}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is GetAllProctorsStudentsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetAllProctorsStudentsFailureState) {
              return const ErrorScreen();
            }
            if (state is GetAllProctorsStudentsEmptyState) {
              return const EmptyPage(
                  message: "No Students found please Add Students");
            } else {
              return const ErrorUnkown();
            }
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: 50,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            navigationpush(
                context,
                AddStudentsUnderProctor(
                    
                    students: widget.students, proctor: widget.proctor));
          },
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
