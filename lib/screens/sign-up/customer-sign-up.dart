import 'package:combat_food/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({Key? key}) : super(key: key);
  @override
  _CustomerSignUp createState() => _CustomerSignUp();
}

class _CustomerSignUp extends State<CustomerSignUp> {
  String _email = "";
  String _phoneNumber = "";
  String _firstName = "";
  String _lastName = "";
  String _password = "";
  String _confirmationPassword = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email*'),
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
        if (email != null) {
          setState(() {
            _email = email;
          });
        }
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number*'),
      keyboardType: TextInputType.phone,
      validator: (String? value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return 'Phone number is Required';
        }
        return null;
      },
      onSaved: (String? phoneNumber) {
        if (phoneNumber != null) {
          setState(() {
            _phoneNumber = phoneNumber;
          });
        }
      },
    );
  }

  Widget _buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'First Name is Required.' : null,
      onSaved: (String? firstName) {
        if (firstName != null) {
          setState(() {
            _firstName = firstName;
          });
        }
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Last Name is Required.' : null,
      onSaved: (String? lastName) {
        if (lastName != null) {
          setState(() {
            _lastName = lastName;
          });
        }
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password*'),
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
        if (value != null) {
          setState(() {
            _password = value;
          });
        }
      },
    );
  }

  Widget _buildConfirmationPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Confirm Password*'),
      obscureText: true,
      validator: (String? value) {
        if (value == null) return null;
        if (value != _password) {
          return 'Password does not match.';
        }
        return null;
      },
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            _confirmationPassword = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          margin: const EdgeInsets.all(50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Customer",
                    style: TextStyle(fontSize: 15, letterSpacing: 1.5)),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildFirstName(),
                _buildLastName(),
                _buildPassword(),
                _buildConfirmationPassword(),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(FontAwesomeIcons.arrowAltCircleUp),
                    label: const Text('Sign Up'),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      Map<String, String> data = {
                        "email": _email,
                        "phoneNumber": _phoneNumber,
                        "firstName": _firstName,
                        "lastName": _lastName,
                      };
                      AuthService()
                          .emailPasswordSignUp(_email, _password, data);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
