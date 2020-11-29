import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seatlect_mobile/nav/cubit/nav_cubit.dart';

class NavAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(builder: (context, state) {
      return AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Placeholder for now'));
    });
  }
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(builder: (context, state) {
      return Drawer();
    });
  }
}
