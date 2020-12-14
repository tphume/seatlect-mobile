import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:seatlect_mobile/components/menuItemCard.dart';
import 'package:seatlect_mobile/favorites/bloc/favorite_bloc.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: CustomScrollView(
          slivers: [
            _buildSlider(context),
            _buildBanner(context),
            _buildMenuList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Container(
          width: 300,
          child: Text(
            'Reserve',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21),
          ),
        ),
        backgroundColor: theme.accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildSlider(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: theme.primaryColorLight,
      expandedHeight: 230,
      floating: false,
      pinned: false,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
          background: Swiper(
        itemCount: business.images.length,
        itemBuilder: (BuildContext context, int index) => Image.network(
          business.images[index],
          fit: BoxFit.cover,
        ),
        autoplay: true,
      )),
    );
  }

  Widget _buildBanner(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 15, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  business.name,
                  style: TextStyle(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  maxLines: 1,
                ),
                BlocBuilder<FavoriteBloc, FavoriteState>(
                    builder: (context, state) {
                  final isFavorite =
                      state.businesses.indexWhere((b) => b.id == business.id) !=
                          -1;

                  return GestureDetector(
                    onTap: () {
                      isFavorite
                          ? BlocProvider.of<FavoriteBloc>(context)
                              .add(RemoveFavorite(business: business))
                          : BlocProvider.of<FavoriteBloc>(context)
                              .add(AddFavorite(business: business));
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? theme.errorColor : Colors.black,
                    ),
                  );
                })
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: theme.primaryColor,
                    size: 14,
                  ),
                  Text(
                    business.address,
                    style: TextStyle(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 20),
              child: Text(business.description),
            ),
            Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      sliver: SliverList(
          delegate: SliverChildListDelegate.fixed(business.menu
              .map<Widget>((m) => MenuItemCard(
                    menuItem: m,
                  ))
              .toList(growable: false))),
    );
  }
}
