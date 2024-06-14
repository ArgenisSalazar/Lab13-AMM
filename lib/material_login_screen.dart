import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'user_model.dart';
import 'user_details_screen.dart';

class MaterialLoginScreen extends StatefulWidget {
  const MaterialLoginScreen({super.key});

  @override
  _MaterialLoginScreenState createState() => _MaterialLoginScreenState();
}

class _MaterialLoginScreenState extends State<MaterialLoginScreen> {
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
        MaterialPageRoute(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passphraseController,
              decoration: const InputDecoration(labelText: 'Passphrase'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveUser,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
