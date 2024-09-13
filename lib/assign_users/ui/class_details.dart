// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:necadmin/assign_users/ui/assign_role_user.dart';

import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class ClassDetails extends StatelessWidget {
  final ClassRoom classRoom;
  const ClassDetails({
    super.key,
    required this.classRoom,
  });
  

  @override
  Widget build(BuildContext context) {
    const String deanName = "Dr. John Doe";
    const String deanEmail = "john.doe@university.edu";
    final List<String> academicCoordinators = [
      "Jane Smith",
      "Albert Newton",
      "Emily Davis"
    ];
    final List<String> proctors = ["Robert Brown", "Sarah Johnson"];
   return
    Scaffold(
      appBar: AppBar(
        title: Text(classRoom.classRoomname!),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigationpush(context, const AssignUserToClassRoom());
      } , child: const Icon(Icons.add),),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Container(
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
            child: const ListTile(
              title: Text(
                'Dean',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(deanName, style: TextStyle(color: Colors.white)),
                  Text(deanEmail, style: TextStyle(color: Colors.white70)),
                ],
              ),
              leading: Icon(Icons.person, color: Colors.white),
            ),
          ),

 
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

          ...academicCoordinators.map((coordinator) {
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
                  coordinator,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.school, color: Colors.green),
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

          ...proctors.map((proctor) {
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
                  proctor,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.security, color: Colors.green),
              ),
            );
          }),
        ],
      ),
    );
  }
}
