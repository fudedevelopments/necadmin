// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/assignbloc/assign_bloc.dart';
import 'package:necadmin/assign_users/repo/assign_repo.dart';
import 'package:necadmin/assign_users/ui/students/proctor_students_stutus_page.dart';

import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class AddStudentsUnderProctor extends StatefulWidget {
  final List<Student> students;
  final Proctor proctor;
  const AddStudentsUnderProctor({
    super.key,
    required this.students,
    required this.proctor,
  });

  @override
  State<AddStudentsUnderProctor> createState() =>
      _AddStudentsUnderProctorState();
}

class _AddStudentsUnderProctorState extends State<AddStudentsUnderProctor> {
  List<Student> _filteredStudents = [];
  List<Student> _selectedStudents = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredStudents = widget.students;
  }

  void _filterStudents(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredStudents = widget.students.where((student) {
        final studentName = student.studentname!.toLowerCase();
        final studentEmail = student.email!.toLowerCase();
        return studentName.contains(_searchQuery) ||
            studentEmail.contains(_searchQuery);
      }).toList();
    });
  }

  void _onStudentSelected(bool? selected, Student student) {
    setState(() {
      if (selected == true) {
        _selectedStudents.add(student);
      } else {
        _selectedStudents.remove(student);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Students Under Proctor'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterStudents,
              decoration: const InputDecoration(
                labelText: 'Search by name or email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredStudents.length,
              itemBuilder: (context, index) {
                final student = _filteredStudents[index];
                final isSelected = _selectedStudents.contains(student);
                return ListTile(
                  title: Text(student.studentname!),
                  subtitle: Text(student.email!),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (selected) =>
                        _onStudentSelected(selected, student),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: BlocConsumer<AssignBloc, AssignState>(
          listener: (context, state) {
            if (state is AddStudentsUnderProctorSuccessState) {
              navigatorpushandremove(
                  context,
                  ProctorUserStatusPage(
                      proctor: widget.proctor,
                      users: widget.students,
                      result: state.results));
            }
          },
          builder: (context, state) {
            if (state is AddStudentsUnderProctorloadingtate) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<AssignBloc>(context).add(
                      
                    AssignStudentsInProctor(proctor: widget.proctor, students: _selectedStudents));
                }
                ,
                child: const Text("Add Selected User"),
              );
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
