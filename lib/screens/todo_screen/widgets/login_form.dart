import 'package:drewardsystem/screens/todo_screen/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameTextEditingController =
        TextEditingController();
    final TextEditingController passTextEditingController =
        TextEditingController();
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Column(
        children: [
          TextFormField(
            controller: nameTextEditingController,
            decoration: InputDecoration(hintText: "name field"),
          ),
          TextFormField(
            controller: passTextEditingController,
            decoration: InputDecoration(hintText: "password field"),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(
                AuthLoginEvent(
                  name: nameTextEditingController.text,
                  password: passTextEditingController.text,
                ),
              );
            },
            child: Text("login"),
          ),
        ],
      ),
    );
  }
}
