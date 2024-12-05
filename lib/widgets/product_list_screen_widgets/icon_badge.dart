import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class IconBadge extends StatelessWidget {
  const IconBadge({
    super.key,
    required this.totalQuantity,
  });
  final int totalQuantity;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: totalQuantity > 0,
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      badgeAnimation: const badges.BadgeAnimation.fade(
        animationDuration: Duration(milliseconds: 500),
        colorChangeAnimationDuration: Duration(milliseconds: 500),
      ),
      badgeContent: Center(
        child: Text(
          totalQuantity.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.teal,
        elevation: 2,
        padding: EdgeInsets.all(4),
      ),
      child: const Icon(Icons.shopping_cart),
    );
  }
}
