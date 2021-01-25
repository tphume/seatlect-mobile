import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:business_repository/business_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';

part 'search_event.dart';

part 'search_state.dart';

const NAME_ASC = 'a-Z';
const NAME_DESC = 'Z-a';
const LOCATION_ASC = 'Nearest';
const LOCATION_DESC = 'Furthest';
const PRICE_ASC = 'Highest Price';
const PRICE_DESC = 'Lowest Price';
const DATE_ASC = 'Date ascending';
const DATE_DESC = 'Date descending';

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
