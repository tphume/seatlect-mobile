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
          Container(child: Text('Log in'), alignment: Alignment.centerLeft),
          Container(
              child: Text('Login to continue'),
              alignment: Alignment.centerLeft),
          Container(child: Text('Email'), alignment: Alignment.centerLeft),
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
          Container(child: Text('Password'), alignment: Alignment.centerLeft),
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
          SizedBox(
            width: double.infinity,
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
                'Forgot password',
                style: TextStyle(color: theme.primaryColorLight),
              )),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black54),
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
