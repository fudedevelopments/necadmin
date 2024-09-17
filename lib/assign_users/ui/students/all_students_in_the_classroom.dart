// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:necadmin/assign_users/ui/user_select_screen.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class AllStudentsInTheClassroom extends StatefulWidget {
  final List<Student> students;
  final ClassRoom classRoom;
  const AllStudentsInTheClassroom({
    super.key,
    required this.students,
    required this.classRoom,
  });

  @override
  State<AllStudentsInTheClassroom> createState() =>
      _AllStudentsInTheClassroomState();
}

class _AllStudentsInTheClassroomState extends State<AllStudentsInTheClassroom> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All students in the Classroom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: widget.students.length,
          itemBuilder: (context, index) {
            final student = widget.students[index];
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
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationpush(
              context,
              UserSelectionScreen(
                  classRoom: widget.classRoom, role: "STUDENTS"));
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
