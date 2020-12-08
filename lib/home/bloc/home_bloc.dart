import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_repository/business_repository.dart';
import 'package:genproto/genproto.dart' as proto;
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
  ) async* {
    if (event is HomeFetchBusiness) {
      if (event.location == null) {
        yield HomeEmpty();
      } else {
        try {
          yield HomeFetching();

          final businessList = await businessRepo.ListBusiness(
              3, proto.Sort.LOCATION_ASC,
              location: event.location);

          yield HomePopulated(businessList: businessList);
        } catch (e) {
          yield HomeEmpty();
        }
      }
    }
  }
}
