part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

// Reset everything
class SearchReset extends SearchEvent {
  @override
  List<Object> get props {
    return [];
  }
}

// Update Filter Arguments
class SearchUpdateArgs extends SearchEvent {
  final String name;
  final String type;
  final List<String> tags;
  final Location location;
  final int startPrice;
  final int endPrice;
  final DateTime startDate;
  final DateTime endDate;

  SearchUpdateArgs(
      {@required this.name,
      @required this.type,
      @required this.tags,
      @required this.location,
      @required this.startPrice,
      @required this.endPrice,
      @required this.startDate,
      @required this.endDate})
      : assert(name != null),
        assert(type != null),
        assert(tags != null),
        assert(location != null),
        assert(startPrice != null),
        assert(endPrice != null),
        assert(startDate != null),
        assert(endDate != null);

  @override
  List<Object> get props {
    return [
      name,
      type,
      tags,
      location,
      startPrice,
      endPrice,
      startDate,
      endDate
    ];
  }
}
