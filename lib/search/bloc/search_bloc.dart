import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_repository/business_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BusinessRepo businessRepo;

  SearchBloc({@required this.businessRepo})
      : assert(businessRepo != null),
        super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchReset) {
      yield SearchInitial();
    } else if (event is SearchUpdateArgs) {
      yield SearchCurrent(
          name: event.name,
          type: event.type == "Type" ? "" : event.type,
          tags: event.tags,
          location: event.location,
          startPrice: event.startPrice,
          endPrice: event.endPrice,
          startDate: event.startDate,
          endDate: event.endDate);
    }
  }
}
