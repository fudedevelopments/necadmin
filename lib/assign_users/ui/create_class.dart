import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/assign_users/assignbloc/assign_bloc.dart';
import 'package:necadmin/assign_users/ui/assign_users_page.dart';
import 'package:necadmin/models/ModelProvider.dart';
import 'package:necadmin/utils.dart';

class CreateClassScreen extends StatefulWidget {
  const CreateClassScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateClassScreenState createState() => _CreateClassScreenState();
}

class _CreateClassScreenState extends State<CreateClassScreen> {
  final TextEditingController _classNameController = TextEditingController();

  @override
  void dispose() {
    _classNameController.dispose();
    super.dispose();
  }

  void _createClass() async {
    final className = _classNameController.text.trim();
    if (className.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a class name.')),
      );
    } else {
      BlocProvider.of<AssignBloc>(context)
          .add(CreateclassEvent(classname: _classNameController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Create Class'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF36D1DC),
                  Color(0xFF5B86E5)
                ], // Teal to Blue Gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(
                      Icons.class_,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _classNameController,
                      style: const TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Enter Class Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<AssignBloc, AssignState>(
                    listener: (context, state) {
                      if (state is CreateClassSuccessState) {
                        showsnakbar(context, "class created successfully");
                        navigatorpushandremove(context, const AssignUsersPage());
                      }
                      if (state is CreateClassfailureState) {
                        showsnakbar(context, "failed in creating class");
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateClassloadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: _createClass,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFF36D1DC),
                            backgroundColor:
                                Colors.white, // Matching the gradient color
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Create Class',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Organize your students and assignments with ease.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
