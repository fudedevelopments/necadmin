import 'package:flutter/material.dart';
import 'package:necadmin/manageUser/repository/manage_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              addusertoGroup(
                  role: "STAFF",
                  userId: "b1830dda-b041-702e-45c1-dfad5ae830c3");
            },
            child: const Text("press")),
      ),
    );
  }
}
