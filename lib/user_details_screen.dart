import 'package:flutter/material.dart';
import 'user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${user.username}', style: TextStyle(fontSize: 20)),
            Text('Passphrase: ${user.passphrase}',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
