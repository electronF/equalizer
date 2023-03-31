import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';

List<Widget> buildSocialMedia(
    List<Map<String, dynamic>> socialMediaList, dynamic lang, Color bgColor) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (var socialMedia in socialMediaList)
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: (bgColor == background) ? primary : background,
              ),
              child: Center(
                child: Icon(socialMedia['icon'], size: 24, color: bgColor),
              ),
            ),
          ),
      ],
    )
  ];
}
