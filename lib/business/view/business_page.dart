import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:seatlect_mobile/components/menuItemCard.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          ),
          SliverList(
              delegate: SliverChildListDelegate.fixed(
                  business.menu.map<Widget>((m) => MenuItemCard(
                        menuItem: m,
                      )))),
        ],
      ),
    );
  }
}
