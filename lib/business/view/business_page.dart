import 'package:entity/entity.dart';
import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  final Business business;

  static Route route({@required Business business}) {
    return MaterialPageRoute(
        builder: (_) => BusinessPage(
              business: business,
            ));
  }

  BusinessPage({@required this.business});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
