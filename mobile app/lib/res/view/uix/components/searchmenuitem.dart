import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';

class SearchMenuItem extends StatelessWidget {
  const SearchMenuItem(
      {super.key,
      required this.itemName,
      this.itemColor = primaryDark,
      this.isActive = false});

  final Color itemColor;
  final String itemName;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemName.length * 12 * .57,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            itemName,
            style: TextStyle(color: itemColor, fontSize: 12),
          ),
          Container(
            color: isActive ? itemColor : Colors.transparent,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5),
            height: 1.5,
          )
        ],
      ),
    );
  }
}
