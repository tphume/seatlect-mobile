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

// Update Name Filter
class SearchUpdateName extends SearchEvent {
  final String name;

  SearchUpdateName({@required this.name}) : assert(name != null);

  @override
  List<Object> get props {
    return [name];
  }
}

// Update Type Filter
class SearchUpdateType extends SearchEvent {
  final String type;

  SearchUpdateType({@required this.type}) : assert(type != null);

  @override
  List<Object> get props {
    return [type];
  }
}

// Update Tags Filter
class SearchUpdateTags extends SearchEvent {
  final String tags;

  SearchUpdateTags({@required this.tags}) : assert(tags != null);

  @override
  List<Object> get props {
    return [tags];
  }
}

// Update Location Filter
class SearchUpdateLocation extends SearchEvent {
  final Location location;

  SearchUpdateLocation({@required this.location}) : assert(location != null);

  @override
  List<Object> get props {
    return [Location];
  }
}

// Update Start Price Filter
class SearchUpdateStartPrice extends SearchEvent {
  final int startPrice;

  SearchUpdateStartPrice({@required this.startPrice})
      : assert(startPrice != null);

  @override
  List<Object> get props {
    return [startPrice];
  }
}

// Update End Price Filter
class SearchUpdateEndPrice extends SearchEvent {
  final int endPrice;

  SearchUpdateEndPrice({@required this.endPrice}) : assert(endPrice != null);

  @override
  List<Object> get props {
    return [endPrice];
  }
}

// Update Start Date Filter
class SearchUpdateStartDate extends SearchEvent {
  final DateTime startDate;

  SearchUpdateStartDate({@required this.startDate}) : assert(startDate != null);

  @override
  List<Object> get props {
    return [startDate];
  }
}

// Update End Date Filter
class SearchUpdateEndDate extends SearchEvent {
  final DateTime endDate;

  SearchUpdateEndDate({@required this.endDate}) : assert(endDate != null);

  @override
  List<Object> get props {
    return [endDate];
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

// SearchUpdate
