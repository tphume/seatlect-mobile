import 'package:flutter/material.dart';

import 'package:entity/entity.dart';

class OrderDetail extends StatelessWidget {
  final Order order;

  OrderDetail({@required this.order});

  static Route route(Order order) {
    return MaterialPageRoute(builder: (_) => OrderDetail(order: order));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
