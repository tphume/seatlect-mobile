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
  OrderFetch();

  @override
  List<Object> get props {
    return [];
  }
}
