import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _email = "";
  String _phoneNumber = "";
  String _firstName = "";
  String _lastName = "";
  String _password = "";
  String _confirmationPassword = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return 'Phone number is Required';
        }
        return null;
      },
      onSaved: (String? phoneNumber) {
        if (phoneNumber != null) _phoneNumber = phoneNumber;
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'First Name is Required.' : null,
      onSaved: (String? firstName) {
        if (firstName != null) _firstName = firstName;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Last Name is Required.' : null,
      onSaved: (String? lastName) {
        if (lastName != null) _lastName = lastName;
      },
    );
  }

  Widget _buildName() {
    return Container(
      child: Row(
        children: [
          _buildFirstName(),
          _buildLastName(),
        ],
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return 'Password is Required';
        }
        return null;
      },
      onSaved: (String? value) {
        if (value != null) _password = value;
      },
    );
  }

  Widget _buildConfirmationPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String? value) {
        if (value == null) return null;
        if (value != _password) {
          return 'Password does not match.';
        }
        return null;
      },
      onSaved: (String? value) {
        if (value != null) _confirmationPassword = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildEmail(),
                  _buildPhoneNumber(),
                  _buildFirstName(),
                  _buildLastName(),
                  _buildPassword(),
                  _buildConfirmationPassword(),
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
