part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final String name;
  final String type;
  final List<String> tags;
  final Location location;
  final String address;
  final int startPrice;
  final int endPrice;
  final DateTime startDate;
  final DateTime endDate;
  final String sortBy;

  SearchState(
      {@required this.name,
      @required this.type,
      @required this.tags,
      @required this.location,
      @required this.address,
      @required this.startPrice,
      @required this.endPrice,
      @required this.startDate,
      @required this.endDate,
      @required this.sortBy})
      : assert(name != null),
        assert(type != null),
        assert(tags != null),
        assert(location != null),
        assert(address != null),
        assert(startPrice != null),
        assert(endPrice != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(sortBy != null);

  @override
  List<Object> get props {
    return [
      name,
      type,
      tags,
      location,
      address,
      startPrice,
      endPrice,
      startDate,
      endDate,
      sortBy
    ];
  }
}

class SearchInitial extends SearchState {
  SearchInitial()
      : super(
            name: '',
            type: 'Restaurant',
            tags: [],
            location: Location(latitude: 13.7563, longitude: 100.5018),
            address: 'Bangkok',
            startPrice: 0,
            endPrice: 1000,
            startDate: DateTime.now(),
            endDate: DateTime.now().add(Duration(days: 1)),
            sortBy: NAME_ASC);
}

class SearchCurrent extends SearchState {
  SearchCurrent(
      {@required name,
      @required type,
      @required tags,
      @required location,
      @required address,
      @required startPrice,
      @required endPrice,
      @required startDate,
      @required endDate,
      @required sortBy})
      : assert(name != null),
        assert(type != null),
        assert(tags != null),
        assert(location != null),
        assert(address != null),
        assert(startPrice != null),
        assert(endPrice != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(sortBy != null),
        super(
            name: name,
            type: type,
            tags: tags,
            location: location,
            address: address,
            startPrice: startPrice,
            endPrice: endPrice,
            startDate: startDate,
            endDate: endDate,
            sortBy: sortBy);
}
