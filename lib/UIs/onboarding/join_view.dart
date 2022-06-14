import 'package:flutter/material.dart';
import 'package:ping/Core/Models/user_model.dart';
import 'package:ping/Core/Services/auth_service.dart';

class JoinView extends StatelessWidget {
  JoinView({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () async {
                await AuthService.signIn(User(
                    id: DateTime.now().microsecondsSinceEpoch,
                    username: controller.text));
              },
              child: const Text("JOIN"))
        ],
      ),
    );
  }
}
