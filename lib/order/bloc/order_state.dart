part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  final List<Order> orders;

  const OrderState({@required this.orders}) : assert(orders != null);

  @override
  List<Object> get props {
    return [this.orders];
  }
}

class OrderInitial extends OrderState {
  OrderInitial() : super(orders: []);
}

class OrderCurrent extends OrderState {
  OrderCurrent({@required orders}) : super(orders: orders);
}
