import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
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
    } else if (event is SearchUpdateName) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.name = event.name;
      yield s;
    } else if (event is SearchUpdateType) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.type = event.type;
      yield s;
    } else if (event is SearchUpdateLocation) {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          event.location.latitude, event.location.longitude);

      SearchCurrent s = SearchCurrent.clone(state);
      s.location = event.location;
      s.address = placemarks[0].street.isNotEmpty
          ? '${placemarks[0].street}, ${placemarks[0].administrativeArea}'
          : placemarks[0].administrativeArea;

      yield s;
    } else if (event is SearchUpdateStartPrice) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.startPrice = event.startPrice;
      yield s;
    } else if (event is SearchUpdateEndPrice) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.endPrice = event.endPrice;
      yield s;
    } else if (event is SearchUpdateStartDate) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.startDate = event.startDate;
      yield s;
    } else if (event is SearchUpdateEndDate) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.endDate = event.endDate;
      yield s;
    } else if (event is SearchUpdateSortBy) {
      SearchCurrent s = SearchCurrent.clone(state);
      s.sortBy = event.sortBy;
      yield s;
    }
  }
}
