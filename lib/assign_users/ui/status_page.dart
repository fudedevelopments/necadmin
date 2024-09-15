// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:necadmin/landing_page/ui/landing_page.dart';
import 'package:necadmin/models/ClassRoom.dart';
import 'package:necadmin/utils.dart';

class UserStatusPage extends StatefulWidget {
  final ClassRoom classRoom;
  final List users;
  final List<bool> result;
  const UserStatusPage({
    super.key,
    required this.classRoom,
    required this.users,
    required this.result,
  });

  @override
  // ignore: library_private_types_in_public_api
  _UserStatusPageState createState() => _UserStatusPageState();
}

class _UserStatusPageState extends State<UserStatusPage> {
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
          child: const Text("Go to Home Page"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("User Status : ${widget.classRoom.classRoomname}"),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.users.length,
              itemBuilder: (context, index) {
                final user = widget.users[index];
                return ListTile(
                    title: Text(user.sub),
                    subtitle: Text(user.email),
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
