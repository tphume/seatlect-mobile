import 'package:entity/entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemCard({@required this.menuItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 7, bottom: 7),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFF828282), width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: theme.primaryColorLight,
                  borderRadius: BorderRadius.circular(13),
                  image: menuItem.image.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(menuItem.image),
                          fit: BoxFit.cover)
                      : null)),
          Container(
            width: 210,
            padding: EdgeInsets.only(top: 3, bottom: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  menuItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.yantramanav(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  menuItem.description,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.yantramanav(),
                )
              ],
            ),
          ),
          Container(
            width: 55,
            padding: EdgeInsets.only(top: 3),
            alignment: Alignment.topRight,
            child: Text(
              '${menuItem.price}',
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: GoogleFonts.yantramanav(
                  fontWeight: FontWeight.w500, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
