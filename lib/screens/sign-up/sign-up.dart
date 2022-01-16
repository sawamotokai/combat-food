import 'package:combat_food/screens/sign-up/customer-sign-up.dart';
import 'package:combat_food/screens/sign-up/vendor-sign-up.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

enum UserType {
  customer,
  vendor,
}

class _SignUpScreenState extends State<SignUpScreen> {
  int pageIndex = 0;
  UserType _userType = UserType.customer;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    _userType = UserType.customer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      backgroundColor: Colors.yellow[50],
      body: IndexedStack(index: pageIndex, children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text('What Type of Customer are you?',
                        style: TextStyle(fontSize: 20))),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('Customer'),
                  leading: Radio<UserType>(
                    value: UserType.customer,
                    groupValue: _userType,
                    onChanged: (UserType? value) {
                      if (value != null) {
                        setState(() {
                          _userType = value;
                        });
                      }
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Vendor'),
                  leading: Radio<UserType>(
                    value: UserType.vendor,
                    groupValue: _userType,
                    onChanged: (UserType? value) {
                      if (value != null) {
                        setState(() {
                          _userType = value;
                        });
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  child: const Text('Next'),
                  onPressed: () {
                    setState(() {
                      switch (_userType) {
                        case UserType.customer:
                          pageIndex = 1;
                          break;
                        case UserType.vendor:
                          pageIndex = 2;
                          break;
                      }
                    });
                  },
                ),
              ],
            )),
        CustomerSignUp(),
        VendorSignUp(),
      ]),
    );
  }
}
