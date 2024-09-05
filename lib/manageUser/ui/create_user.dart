import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:necadmin/manageUser/adduserbloc/manageuser_bloc.dart';
import 'package:necadmin/manageUser/ui/assign_user_role.dart';
import 'package:necadmin/utils.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
 // ignore: library_private_types_in_public_api
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _scaleButton = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create user'),
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                      prefixIcon: Icon(Icons.account_circle,
                          color: Colors.teal.shade700),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade700),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                      prefixIcon:
                          Icon(Icons.email, color: Colors.teal.shade700),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade700),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.teal.shade900),
                      filled: true,
                      fillColor: Colors.teal.shade50,
                      prefixIcon: Icon(Icons.lock, color: Colors.teal.shade700),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.teal.shade700),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: BlocConsumer<ManageuserBloc, ManageuserState>(
                      listener: (context, state) {
                        if (state is CreateUserSuccessState) {
                          showsnakbar(context, "Successfully Created user");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  AssignUserRole(userId: _emailController.text,)),
                              (route) => false);
                        }
                        if (state is CreateUserFailureState) {
                          showsnakbar(context, "Failed :${state.errors}");
                        }
                      },
                      builder: (context, state) {
                        if (state is CreateUserLoadingState) {
                          return const CircularProgressIndicator();
                        } else {
                          return GestureDetector(
                            onTapDown: (_) =>
                                setState(() => _scaleButton = 0.95),
                            onTapUp: (_) => setState(() => _scaleButton = 1.0),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ManageuserBloc>(context).add(
                                    CreateUserEvent(
                                        name: _usernameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text));
                              }
                            },
                            child: Transform.scale(
                              scale: _scaleButton,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.teal.shade600,
                                      Colors.teal.shade400
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.teal.shade300.withOpacity(0.5),
                                      blurRadius: 8,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'Create user',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
