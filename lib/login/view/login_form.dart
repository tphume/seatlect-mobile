import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Log in'),
          Text('Login to continue'),
          Text('Email'),
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
          Text('Password'),
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
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // TODO: Call user repository
                }
              },
              child: Text('Login')),
          TextButton(
              onPressed: () => 'placeholder', child: Text('Forgot password')),
          OutlinedButton(
              onPressed: () => 'placeholder', child: Text('Create Account'))
        ],
      ),
    );
  }
}
