import 'package:flutter/material.dart';
import 'package:trading_app/constants/colors.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle, this.onPress,
  });
  final IconData iconData;
  final String title;
  final String subTitle;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      onTap: onPress,
      leading: Icon(
        iconData,
        color: dark ? TColor.grey : TColor.darkerGrey,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
