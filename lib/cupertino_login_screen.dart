import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user_model.dart';
import 'user_details_screen.dart';

class CupertinoLoginScreen extends StatefulWidget {
  const CupertinoLoginScreen({super.key});

  @override
  _CupertinoLoginScreenState createState() => _CupertinoLoginScreenState();
}

class _CupertinoLoginScreenState extends State<CupertinoLoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passphraseController = TextEditingController();

  void _saveUser() async {
    String username = _usernameController.text;
    String passphrase = _passphraseController.text;

    if (username.isNotEmpty && passphrase.isNotEmpty) {
      UserModel newUser = UserModel(
        username: username,
        passphrase: passphrase,
      );

      await DatabaseHelper.instance.create(newUser);

      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => UserDetailsScreen(user: newUser),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoTextField(
              controller: _usernameController,
              placeholder: 'Username',
            ),
            CupertinoTextField(
              controller: _passphraseController,
              placeholder: 'Passphrase',
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: _saveUser,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
