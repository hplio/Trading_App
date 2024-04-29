import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.iconData = Iconsax.arrow_right_3_copy,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final IconData? iconData;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
          ),
        ),
      ],
    );
  }
}
