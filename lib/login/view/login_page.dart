import 'package:flutter/material.dart';

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
          Expanded(flex: 4, child: Text('Placeholder for logo')),
          Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(30),
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
