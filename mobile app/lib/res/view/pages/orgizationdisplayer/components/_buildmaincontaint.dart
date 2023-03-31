import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';

Widget buildMainContent(bool displayTitleBarTitle, bool displayTitleBarSubtitle,
    Widget? image, String? titleBarTitle, String? titleBarSubtitle) {
  return SizedBox(
    height: 30,
    child: Row(
      children: [
        Container(
          width: 30,
          height: 30,
          margin: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            color: Color(0xFFD3D3D3),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: image,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (!displayTitleBarTitle)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      titleBarTitle ?? "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            (!displayTitleBarSubtitle)
                ? Container()
                : Text(
                    titleBarSubtitle ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: textPrimary, fontSize: 10),
                  )
          ],
        )
      ],
    ),
  );
}
