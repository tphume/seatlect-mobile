import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:business_repository/business_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';

part 'search_event.dart';

part 'search_state.dart';

const NAME_ASC = 'Name \u{25b2}';
const NAME_DESC = 'Name \u{25bc}';
const LOCATION_ASC = 'Location \u{25b2}';
const LOCATION_DESC = 'Location \u{25bc}';
const PRICE_ASC = 'Price \u{25b2}';
const PRICE_DESC = 'Price \u{25bc}';
const DATE_ASC = 'Date \u{25b2}';
const DATE_DESC = 'Date \u{25bc}';

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
    }
  }
}
