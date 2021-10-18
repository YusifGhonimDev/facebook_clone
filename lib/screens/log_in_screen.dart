import 'package:facebook_clone/screens/time_line_screen.dart';
import 'package:flutter/material.dart';
import 'sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _validateForm() {
    return _formKey.currentState!.validate() ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Username can't be empty." : null,
                  textInputAction: TextInputAction.next,
                  controller: _username,
                  decoration: const InputDecoration(
                    hintText: "Username",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? "Password can't be empty." : null,
                  controller: _password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.grey,
                  onPressed: () {
                    if (_validateForm()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              TimeLineScreen(username: _username)));
                    }
                  },
                  child: const Text("Log In"),
                ),
                const SizedBox(height: 200),
                TextButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen())),
                  child: const Text(
                    "Don't have an account?\n\nSign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
