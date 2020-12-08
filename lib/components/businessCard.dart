import 'package:entity/entity.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final Business business;

  BusinessCard({@required this.business});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Color(0xffE4E0EF),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Color(0xFFEAEAEA), blurRadius: 4, spreadRadius: 5)
          ]),
      child: Row(),
    );
  }
}
