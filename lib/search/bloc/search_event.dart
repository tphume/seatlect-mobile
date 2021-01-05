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
      {this.name,
      this.type,
      this.tags,
      this.location,
      this.startPrice,
      this.endPrice,
      this.startDate,
      this.endDate});

  @override
  List<Object> get props {
    return [];
  }
}

// Fetching business
class SearchBusiness extends SearchEvent {
  @override
  List<Object> get props {
    return [];
  }
}
