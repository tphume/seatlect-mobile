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
    }
  }
}
