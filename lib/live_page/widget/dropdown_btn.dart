import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading_app/constants/colors.dart';
import 'package:trading_app/live_page/controller/nse_controller.dart';

class KDropdownBtn extends StatelessWidget {
  const KDropdownBtn({
    super.key,
    required this.selectedItem,
    required this.list,
  });
  final String selectedItem;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(NSEController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.list,
            color: dark ? TColor.grey : TColor.darkerGrey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: dark ? TColor.grey : TColor.darkerGrey,
            ),
          ),
        ),
        items: list
            .map(
              (option) => DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                ),
              ),
            )
            .toList(),
        value: selectedItem,
        onChanged:(value) =>controller.changeVale(value),
      ),
    );
  }
}
