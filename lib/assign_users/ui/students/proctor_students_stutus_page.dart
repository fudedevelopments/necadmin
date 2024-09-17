// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:necadmin/landing_page/ui/landing_page.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class ProctorUserStatusPage extends StatefulWidget {
  final List<Student> users;
  final List<bool> result;
  final Proctor proctor;
  const ProctorUserStatusPage({
    super.key,
    required this.users,
    required this.result,
    required this.proctor,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProctorUserStatusPageState createState() => _ProctorUserStatusPageState();
}

class _ProctorUserStatusPageState extends State<ProctorUserStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Status Page'),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {
            navigatorpushandremove(context, const LandingPage());
          },
          child: const Text("Go to Home"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Proctor : ${widget.proctor.proctorname}"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                final user = widget.users[index];
                return ListTile(
                    title: Text(user.studentname!),
                    subtitle: Text(user.email!),
                    trailing: widget.result[index] == true
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.cancel_outlined,
                            color: Colors.red,
                          ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
