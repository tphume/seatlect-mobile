import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seatlect_mobile/user/bloc/user_bloc.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Column(
        children: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserAuthError) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Authentication error'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Theme.of(context).errorColor,
                ));
              } else if (state is UserAuthCalling) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                              height: 200, child: CircularProgressIndicator()));
                    });
              }
            },
            child: Container(),
          ),
          Expanded(flex: 3, child: Text('Placeholder for logo')),
          Expanded(
              flex: 7,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(top: 30, right: 30, bottom: 0, left: 30),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: LoginForm(),
              ))
        ],
      ),
    );
  }
}
