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
          children: [
            Container(
                width: 365,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text(
                        order.business.name,
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 19),
                      )),
                      _buildRow(context,
                          firstTitle: 'Date',
                          firstContent:
                              '${order.start.day}-${order.start.month}-${order.start.year}',
                          secondTitle: 'Seat',
                          secondContent:
                              order.seats.map((s) => s.name).join(',')),
                      Row(),
                      Row()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildRow(context,
      {@required String firstTitle,
      @required String firstContent,
      @required String secondTitle,
      @required String secondContent}) {
    final theme = Theme.of(context);

    final contentStyle = TextStyle(
        fontWeight: FontWeight.w700, fontSize: 19, color: theme.primaryColor);

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF828282))),
                  Text(firstContent, style: contentStyle)
                ],
              )),
          Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(secondTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF828282))),
                  Text(
                    secondContent,
                    style: contentStyle,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
