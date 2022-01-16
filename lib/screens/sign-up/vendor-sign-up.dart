import 'package:combat_food/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VendorSignUp extends StatefulWidget {
  const VendorSignUp({Key? key}) : super(key: key);
  @override
  _VendorSignUp createState() => _VendorSignUp();
}

class _VendorSignUp extends State<VendorSignUp> {
  String _email = "";
  String _phoneNumber = "";
  String _vendorName = "";
  String _postalCode = "";
  String _streetAddress = "";
  String _city = "";
  String _province = "";
  String _password = "";
  String _confirmationPassword = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPostalCode() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Postal Code*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Postal Code is Required.' : null,
      onSaved: (String? postalCode) {
        if (postalCode != null) {
          setState(() {
            _postalCode = postalCode;
          });
        }
      },
    );
  }

  Widget _buildStreetAddress() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Street Address*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Street Address is Required.' : null,
      onSaved: (String? streetAddress) {
        if (streetAddress != null) {
          setState(() {
            _streetAddress = streetAddress;
          });
        }
      },
    );
  }

  Widget _buildCity() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'City*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'City is Required.' : null,
      onSaved: (String? city) {
        if (city != null) {
          setState(() {
            _city = city;
          });
        }
      },
    );
  }

  Widget _buildProvince() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Province*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Province is Required.' : null,
      onSaved: (String? province) {
        if (province != null) {
          setState(() {
            _province = province;
          });
        }
      },
    );
  }

  Widget _buildVendorName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Vendor Name*'),
      validator: (String? value) =>
          value != null && value.isEmpty ? 'Vendor Name is Required.' : null,
      onSaved: (String? vendorName) {
        if (vendorName != null) {
          setState(() {
            _vendorName = vendorName;
          });
        }
      },
    );
  }

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
                const Text("Vendor",
                    style: TextStyle(fontSize: 15, letterSpacing: 1.5)),
                _buildEmail(),
                _buildPhoneNumber(),
                _buildVendorName(),
                _buildStreetAddress(),
                _buildCity(),
                _buildProvince(),
                _buildPostalCode(),
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
                        "vendorName": _vendorName,
                        "streetAddress": _streetAddress,
                        "city": _city,
                        "province": _province,
                        "postalCode": _postalCode,
                        "userType": "vendor",
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
