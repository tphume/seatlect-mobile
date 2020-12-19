import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:entity/entity.dart';
import 'package:order_repository/order_repository.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepo orderRepo;

  OrderBloc({@required this.orderRepo}) : super(OrderInitial());

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    if (event is OrderReset) {
      yield OrderInitial();
    } else if (event is OrderFetch) {
      try {
        final orders = await orderRepo.ListOrder(10, 1);
        yield OrderCurrent(orders: orders);
      } catch (e) {}
    }
  }
}
