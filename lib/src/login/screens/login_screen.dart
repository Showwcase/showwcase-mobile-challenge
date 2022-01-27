import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/constants/app_routes.dart';
import 'package:flutter_challenge/src/login/domain/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginService = LoginService();

  bool _obscure = true;

  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: FlutterLogo(size: 300)),
              Text(
                'Login to continue',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  label: Text('Username'),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: password,
                obscureText: _obscure,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: _obscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (_) =>
                            const Center(child: CircularProgressIndicator()));

                    // TODO validate details
                    var res =
                        await _loginService.login(username.text, password.text);

                    Navigator.of(context, rootNavigator: true).pop();

                    Navigator.pushReplacementNamed(context, homeScreen);
                  },
                  child: const Text('sign in'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
