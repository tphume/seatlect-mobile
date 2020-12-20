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
    final media = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: media.size.height,
        width: media.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFED37F), Color(0xFFCFBEED)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Container()],
        ),
      ),
    );
  }
}
