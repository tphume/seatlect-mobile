import 'package:cached_network_image/cached_network_image.dart';
import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatlect_mobile/components/businessCard.dart';
import 'package:seatlect_mobile/location/bloc/location_cubit.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 10),
            child: _buildImages(),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              business.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(bottom: 10),
            child: BusinessCardLocation(business: business),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            margin: EdgeInsets.only(bottom: 10),
            child: BusinessCardTags(
              tags: business.tags,
            ),
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
                margin: EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                  ),
                )))
            .toList());
  }

  Widget _buildLocation(context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          business.address,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.yantramanav(
              fontWeight: FontWeight.w400, color: Color(0xFF4F4F4F)),
        ),
        BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
          if (state is LocationSelected) {
            final distance = (Geolocator.distanceBetween(
                        state.location.latitude,
                        state.location.longitude,
                        business.location.latitude,
                        business.location.longitude) /
                    1000)
                .toStringAsFixed(1);
            return Row(
              children: [
                Icon(
                  Icons.location_on_sharp,
                  color: theme.primaryColor,
                  size: 12,
                ),
                Text(
                  '$distance km away',
                  maxLines: 1,
                  style: GoogleFonts.yantramanav(fontWeight: FontWeight.w500),
                )
              ],
            );
          }

          return Text('');
        })
      ],
    );
  }
}
