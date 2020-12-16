import 'package:cached_network_image/cached_network_image.dart';
import 'package:entity/entity.dart';
import 'package:flutter/material.dart';

class BigBusinessCard extends StatelessWidget {
  final Business business;

  BigBusinessCard({@required this.business});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 315,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 10),
            child: _buildImages(),
          )
        ],
      ),
    );
  }

  Widget _buildImages() {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: business.images
            .map<Widget>((img) => Container(
                width: 250,
                height: 150,
                margin: EdgeInsets.only(left: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                  ),
                )))
            .toList());
  }
}
