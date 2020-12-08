import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_repository/business_repository.dart';
import 'package:meta/meta.dart';
import 'package:entity/entity.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BusinessRepo businessRepo;

  HomeBloc({@required this.businessRepo}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {}
}
