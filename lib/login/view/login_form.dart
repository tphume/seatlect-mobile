import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

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
          Container(
            margin: EdgeInsets.only(top: 10, right: 0, bottom: 0, left: 0),
            child: TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username',
                  fillColor: Color(0xffE0E0E0),
                  filled: true),
              validator: (value) {
                if (value.length < 3) {
                  return 'Username is too short';
                } else if (value.length > 20) {
                  return 'Username is too long';
                }

                return null;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 0, bottom: 0, left: 0),
            child: TextFormField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  fillColor: Color(0xffE0E0E0),
                  filled: true),
              validator: (value) {
                if (value.length < 5) {
                  return 'Password is too short';
                } else if (value.length > 20) {
                  return 'Password is too long';
                }

                return null;
              },
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, right: 0, bottom: 0, left: 0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(theme.primaryColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(20))),
                onPressed: this._login,
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

  void _login() async {
    if (_formKey.currentState.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.transparent,
                child:
                    Container(height: 200, child: CircularProgressIndicator()));
          });

      try {
        await RepositoryProvider.of<UserRepo>(context)
            .login(_username.text, _password.text);

        Navigator.pop(context, true);
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } on AuthFail catch (e) {
        Navigator.pop(context, true);
      } catch (e) {
        Navigator.pop(context, true);
      }
    }
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }
}
