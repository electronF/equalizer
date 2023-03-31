import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';

AppBar appBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: background,
    iconTheme: const IconThemeData(color: primaryDark, size: 32),
    actionsIconTheme: const IconThemeData(color: primaryDark, size: 32),
    elevation: 0,
    title: Text(
      title,
      style: const TextStyle(color: primaryDark, fontSize: 16),
    ),
    actions: [
      PopupMenuButton(
        // icon: Image.asset('./assets/images/icons/vertical-menu-icon.png'),
        itemBuilder: ((context) => [
              PopupMenuItem(
                  child: Row(
                children: const [
                  Icon(
                    Icons.info_outline_rounded,
                    color: primaryDark,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'About',
                      style: TextStyle(color: primaryDark),
                    ),
                  )
                ],
              )),
              PopupMenuItem(
                  child: Row(
                children: const [
                  Icon(
                    Icons.help_outline,
                    color: primaryDark,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'About',
                      style: TextStyle(color: primaryDark),
                    ),
                  ),
                ],
              )),
            ]),
      ),
    ],
  );
}
