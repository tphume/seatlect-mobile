import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:seatlect_mobile/user/bloc/user_bloc.dart';
import 'package:seatlect_mobile/home/home.dart';
import 'package:seatlect_mobile/login/login.dart';

import 'package:user_repository/user_repository.dart';
import 'package:entity/entity.dart';

class App extends StatelessWidget {
  final UserRepo userRepo;

  const App({Key key, @required this.userRepo})
      : assert(userRepo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider<UserRepo>(create: (_) => this.userRepo)],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(create: (_) => UserBloc(userRepo: userRepo))
          ],
          child: AppView(),
        ));
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: '/home',
      routes: {'/home': (_) => HomePage(), '/login': (_) => LoginPage()},
      builder: (context, child) {
        return BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state.user == User.empty) {
              _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
            }
          },
          child: child,
        );
      },
    );
  }
}
