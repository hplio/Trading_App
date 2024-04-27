import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';

class KTabBar extends StatelessWidget implements PreferredSizeWidget {
  const KTabBar({super.key, required this.tabList, this.labelPadding, this.padding});

  final List<Widget> tabList;
  final EdgeInsetsGeometry? labelPadding;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: dark ? Colors.black : TColor.white,
      // color: dark ? TColor.dark : TColor.white,
      child: TabBar(
        tabs: tabList,
        labelPadding:labelPadding ,
        padding:padding ,
        isScrollable: true,
        indicatorColor: TColor.primary,
        labelColor: dark ? TColor.white : TColor.primary,
        unselectedLabelColor: TColor.darkerGrey,
      ),
    );
  }

  @override
  Size get preferredSize =>  const Size.fromHeight(60);
}
