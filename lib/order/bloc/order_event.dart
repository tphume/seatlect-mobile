part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class OrderReset extends OrderEvent {
  @override
  List<Object> get props {
    return [];
  }
}

class OrderFetch extends OrderEvent {
  final int limit;
  final int page;

  OrderFetch({this.limit = 10, this.page = 1});

  @override
  List<Object> get props {
    return [limit, page];
  }
}
