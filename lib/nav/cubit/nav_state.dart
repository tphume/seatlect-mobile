part of 'nav_cubit.dart';

@immutable
abstract class NavState {}

class NavHome extends NavState {}

class NavSearch extends NavState {}

class NavOrder extends NavState {}

class NavSettings extends NavState {}
