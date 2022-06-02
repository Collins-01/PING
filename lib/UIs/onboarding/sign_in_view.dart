import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ping/Core/Models/user_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/UIs/home/messages_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SignIn")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
              onPressed: () async {
                final Faker _faker = Faker();
                await AuthService.signIn(
                  User(
                    id: DateTime.now().millisecondsSinceEpoch,
                    username: _faker.person.firstName(),
                  ),
                );
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const MessagesView()));
              },
              child: const Text("Join"))
        ]),
      ),
    );
  }
}
