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
        slivers: [_buildSlider(context), _buildBanner(), _buildMenuList()],
      ),
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

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: Column(
          children: [],
        ),
      ),
    );
  }

  Widget _buildMenuList() {
    return SliverPadding(
      padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
      sliver: SliverList(
          delegate: SliverChildListDelegate.fixed(business.menu
              .map<Widget>((m) => MenuItemCard(
                    menuItem: m,
                  ))
              .toList(growable: false))),
    );
  }
}
