import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => BusinessPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
