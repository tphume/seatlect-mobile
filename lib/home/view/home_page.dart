import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seatlect_mobile/nav/nav.dart';
import 'package:seatlect_mobile/user/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      return Scaffold(
        appBar: PreferredSize(
            child: NavAppBar(),
            preferredSize: const Size(double.infinity, kToolbarHeight)),
        drawer: NavDrawer().build(context),
        body: Text('Home'),
      );
    });
  }
}
