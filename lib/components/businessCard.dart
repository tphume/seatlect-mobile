import 'package:entity/entity.dart';
import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final Business business;

  BusinessCard({@required this.business});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Color(0xffE4E0EF),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Color(0xFFEAEAEA), blurRadius: 4, spreadRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          Column(
            children: [
              Text(
                business.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(business.address),
              Text(business.tags
                  .map<String>((e) => '${e[0]}${e.substring(1).toLowerCase()}')
                  .toString()
                  .replaceAll('(', '')
                  .replaceAll(')', ''))
            ],
          )
        ],
      ),
    );
  }
}
