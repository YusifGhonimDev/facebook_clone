import 'package:facebook_clone/screens/time_line_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
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
                      value!.isEmpty ? "Email can't be empty." : null,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _email,
                  decoration: const InputDecoration(
                    hintText: "Email",
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
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => TimeLineScreen(
                                    username: _username,
                                  )),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: 200),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Already Have an account?\n\nLogin",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
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
