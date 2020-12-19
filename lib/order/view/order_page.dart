import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:seatlect_mobile/order/bloc/order_bloc.dart';
import 'package:seatlect_mobile/components/drawer_content.dart' as comp;

class OrderPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => OrderPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order',
            style: GoogleFonts.dmSans(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: comp.DrawerContent(comp.Page.order),
      ),
      body: _buildOrders(),
    );
  }

  Widget _buildOrders() {
    return BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) => ListView(
              children: state.orders
                  .map<Widget>((o) => Text(o.reservationId))
                  .toList(),
            ));
  }
}
