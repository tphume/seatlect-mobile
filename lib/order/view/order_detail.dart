import 'package:flutter/material.dart';

import 'package:entity/entity.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:seatlect_mobile/business/business.dart';

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

    Color statusColor;

    switch (order.status) {
      case 'AVAILABLE':
        {
          statusColor = Colors.green;
          break;
        }
      case 'USED':
        {
          statusColor = theme.accentColor;
          break;
        }
      case 'EXPIRED':
        {
          statusColor = theme.errorColor;
          break;
        }
    }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(
                                  left: 7, top: 3, right: 7, bottom: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xFFCFBEED),
                                  borderRadius: BorderRadius.circular(5)),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(BusinessPage.route(
                                      business: order.business));
                                },
                                child: Text(
                                  order.business.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                              )),
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 2.0, color: statusColor),
                            ),
                            child: Center(
                              child: Text(
                                order.status,
                                style: TextStyle(
                                    color: statusColor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildRow(context,
                          firstTitle: 'Date',
                          firstContent:
                              '${order.start.day}-${order.start.month}-${order.start.year}',
                          secondTitle: 'Seat',
                          secondContent:
                              order.seats.map((s) => s.name).join(',')),
                      _buildRow(context,
                          firstTitle: 'Duration',
                          firstContent:
                              '${(order.end.difference(order.start).inHours != 0) ? '${order.end.difference(order.start).inHours} hrs' : ''} ${((order.end.difference(order.start).inMinutes % 60) != 0) ? '${order.end.difference(order.start).inMinutes} mins' : ''}',
                          secondTitle: 'Price',
                          secondContent: '฿${order.totalPrice}'),
                      (order.preorder.length != 0)
                          ? _buildPreorder(context)
                          : Container(),
                      Container(
                        width: 320,
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: QrImage(
                          data: 'placeholder',
                          size: 150,
                        ),
                      )
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
        fontWeight: FontWeight.w700, fontSize: 18, color: theme.primaryColor);

    final titleStyle = TextStyle(
        fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF828282));

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstTitle, style: titleStyle),
                  Text(firstContent, style: contentStyle)
                ],
              )),
          Container(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(secondTitle, style: titleStyle),
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

  Widget _buildPreorder(context) {
    final theme = Theme.of(context);

    final contentStyle = TextStyle(
        fontWeight: FontWeight.w700, fontSize: 15, color: theme.primaryColor);

    final titleStyle = TextStyle(
        fontWeight: FontWeight.w600, fontSize: 15, color: Color(0xFF828282));

    return Container(
        margin: EdgeInsets.only(top: 20),
        width: 320,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Preorder', style: titleStyle),
          ...order.preorder.map<Widget>((p) => Padding(
              padding: EdgeInsets.only(left: 3),
              child: Text(
                'x${p.quantity} ${p.name}',
                style: contentStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )))
        ]));
  }
}
