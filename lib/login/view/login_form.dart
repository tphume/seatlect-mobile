import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
              child: Text(
                'Log in',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
              ),
              alignment: Alignment.centerLeft),
          Container(
              child: Text(
                'Login to continue',
                style: TextStyle(color: Color(0xff828282)),
              ),
              alignment: Alignment.centerLeft),
          TextFormField(
            validator: (value) {
              if (value.length < 3) {
                return 'Username is too short';
              } else if (value.length > 20) {
                return 'Username is too long';
              }

              return null;
            },
          ),
          TextFormField(
            validator: (value) {
              if (value.length < 5) {
                return 'Password is too short';
              } else if (value.length > 20) {
                return 'Password is too long';
              }

              return null;
            },
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30, right: 0, bottom: 0, left: 0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(theme.primaryColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // TODO: Call user repository
                  }
                },
                child: Text('Login')),
          ),
          TextButton(
              onPressed: () => 'placeholder',
              child: Text(
                'Forgot password?',
                style: TextStyle(color: theme.primaryColorLight),
              )),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(Color(0xffE0E0E0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff828282)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                onPressed: () => 'placeholder',
                child: Text('Create Account')),
          ),
        ],
      ),
    );
  }
}
