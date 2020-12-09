import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/favorites/favorites.dart';
import 'package:seatlect_mobile/order/order.dart';
import 'package:seatlect_mobile/search/search.dart';
import 'package:seatlect_mobile/settings/settings.dart';
import 'package:seatlect_mobile/user/user.dart';
import 'package:seatlect_mobile/location/location.dart';
import 'package:seatlect_mobile/home/home.dart';
import 'package:seatlect_mobile/login/login.dart';

import 'package:user_repository/user_repository.dart';
import 'package:business_repository/business_repository.dart';

class App extends StatelessWidget {
  final UserRepo userRepo;
  final BusinessRepo businessRepo;

  const App({Key key, @required this.userRepo, @required this.businessRepo})
      : assert(userRepo != null),
        assert(businessRepo != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserRepo>(create: (_) => this.userRepo),
          RepositoryProvider<BusinessRepo>(create: (_) => this.businessRepo)
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(create: (_) => UserBloc(userRepo: userRepo)),
            BlocProvider<LocationCubit>(create: (_) => LocationCubit()),
            BlocProvider<HomeBloc>(
                create: (_) => HomeBloc(businessRepo: businessRepo))
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
      theme: ThemeData(
          // Define colors
          primaryColor: Color(0xff5D55B4),
          primaryColorLight: Color(0xffADA3D4),
          accentColor: Color(0xffF2B705),
          canvasColor: Color(0xffF1F1F1),
          scaffoldBackgroundColor: Color(0xffF1F1F1),
          backgroundColor: Color(0xffF1F1F1),
          dialogBackgroundColor: Color(0xffFFFFFF),
          errorColor: Color(0xffF24B4B),

          // Text
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),

          // Icon
          primaryIconTheme: IconThemeData(color: Color(0xff5D55B4))),
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/search': (context) => SearchPage(),
        '/favorites': (context) => FavoritesPage(),
        '/order': (context) => OrderPage(),
        '/settings': (context) => SettingsPage()
      },
      builder: (context, child) {
        return BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserUnAuth) {
              // Is called when logout occurs
              _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
              BlocProvider.of<LocationCubit>(context).resetLocation();
            } else if (state is UserAuth) {
              // Is called when login occurs
              _navigator.pushNamedAndRemoveUntil('/home', (route) => false);

              final locationState =
                  BlocProvider.of<LocationCubit>(context).state;
              if (locationState is LocationEmpty) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeFetchBusiness(location: null));
              } else if (locationState is LocationSelected) {
                BlocProvider.of<HomeBloc>(context)
                    .add(HomeFetchBusiness(location: locationState.location));
              }
            }
          },
          child: child,
        );
      },
    );
  }
}
