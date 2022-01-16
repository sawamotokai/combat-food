import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:combat_food/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [LoginForm()],
            )));
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.color,
      required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 20),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(24),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email = "";
  String _password = "";

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return 'Email is Required';
        }
        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }
        return null;
      },
      onSaved: (String? email) {
        if (email != null) _email = email;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (String? value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return 'Password is Required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
      onChanged: (String? value) {
        if (value != null) _password = value;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        _buildEmail(),
        _buildPassword(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: LoginButton(
            icon: FontAwesomeIcons.arrowCircleLeft,
            text: 'Sign In',
            loginMethod: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
              AuthService().emailPasswordSignIn(_email, _password);
            },
            color: Colors.blue,
          ),
        ),
        TextButton(
            onPressed: () {
              // TODO: show registration form
            },
            child: const Text('Create Account')),
      ]),
    );
  }
}
