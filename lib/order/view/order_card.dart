import 'package:cached_network_image/cached_network_image.dart';
import 'package:entity/entity.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({@required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient:
              LinearGradient(colors: [theme.accentColor, Color(0xFFFED37F)])),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: order.business.displayImage,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
