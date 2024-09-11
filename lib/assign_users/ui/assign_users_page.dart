import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:necadmin/models/ModelProvider.dart';

class AssignUsersPage extends StatelessWidget {
  const AssignUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final proctorrequest = ModelQueries.get(
                  Proctor.classType,
                  const ProctorModelIdentifier(
                      id: "3a4b3a8f-a2a6-4742-ab39-863fb2194e32"));
              final proctorresponse =
                  await Amplify.API.query(request: proctorrequest).response;
              final proctor = proctorresponse.data!;
              final proctorstudentsreq = ModelQueries.list(Student.classType,
                  limit: 10, where: Student.PROCTOR.eq(proctor.id));
              safePrint(proctorstudentsreq);
            },
            child: const Text("assign user")),
      ),
    );
  }
}
