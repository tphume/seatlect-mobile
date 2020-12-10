import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatlect_mobile/business/business.dart';
import 'package:seatlect_mobile/location/bloc/location_cubit.dart';

class BusinessCard extends StatelessWidget {
  final Business business;

  BusinessCard({@required this.business});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
        onTap: () {
          // TODO Pass search data to next page
          Navigator.of(context).push(BusinessPage.route(business: business));
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 10),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              color: Color(0xffE4E0EF),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFEAEAEA), blurRadius: 4, spreadRadius: 5)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: theme.primaryColorLight,
                      borderRadius: BorderRadius.circular(13),
                      image: business.displayImage.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(business.displayImage),
                              fit: BoxFit.cover)
                          : null)),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      business.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.yantramanav(
                          fontWeight: FontWeight.w500,
                          fontSize: 21,
                          color: Color(0xFF1F1F24)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          business.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.yantramanav(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4F4F4F)),
                        ),
                        BlocBuilder<LocationCubit, LocationState>(
                            builder: (context, state) {
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
                                  style: GoogleFonts.yantramanav(
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            );
                          }

                          return Text('');
                        })
                      ],
                    ),
                    Text(
                      business.tags
                          .map<String>(
                              (e) => '${e[0]}${e.substring(1).toLowerCase()}')
                          .toString()
                          .replaceAll('(', '')
                          .replaceAll(')', ''),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.yantramanav(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF4F4F4F)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 40,
              )
            ],
          ),
        ));
  }
}
