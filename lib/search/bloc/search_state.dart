part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final String name;
  final String type;
  final List<String> tags;
  final Location location;
  final int startPrice;
  final int endPrice;
  final DateTime startDate;
  final DateTime endDate;

  SearchState(
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

class SearchInitial extends SearchState {
  SearchInitial()
      : super(
            name: "",
            type: "",
            tags: [],
            location: Location(latitude: 13.7563, longitude: 100.5018),
            startPrice: 0,
            endPrice: 1000,
            startDate: DateTime.now(),
            endDate: DateTime.now().add(Duration(days: 0)));
}

class SearchCurrent extends SearchState {
  SearchCurrent(
      {@required name,
      @required type,
      @required tags,
      @required location,
      @required startPrice,
      @required endPrice,
      @required startDate,
      @required endDate})
      : assert(name != null),
        assert(type != null),
        assert(tags != null),
        assert(location != null),
        assert(startPrice != null),
        assert(endPrice != null),
        assert(startDate != null),
        assert(endDate != null),
        super(
            name: name,
            type: type,
            tags: tags,
            location: location,
            startPrice: startPrice,
            endPrice: endPrice,
            startDate: startDate,
            endDate: endDate);
}
