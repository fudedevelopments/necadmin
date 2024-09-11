import 'package:flutter/material.dart';


class AssignUsersPage extends StatelessWidget {
  const AssignUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       floatingActionButton:FloatingActionButton(onPressed: (){
        
       },
       tooltip: "Create class",
        child: const Icon(Icons.class_),),
    );
  }
}
