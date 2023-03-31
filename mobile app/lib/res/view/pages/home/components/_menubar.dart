import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';

menuBar(BuildContext context, double iconSize,
    void Function(String buttonName) changeTab) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13), topRight: Radius.circular(13)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: IconButton(
              onPressed: () => changeTab('message'),
              icon: Image.asset(
                './assets/images/icons/speech-icon.webp',
                width: 28,
                height: 28,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: IconButton(
              onPressed: () => changeTab('home'),
              icon: Image.asset(
                './assets/images/icons/home-page-icon.png',
                width: 48,
                height: 48,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: IconButton(
              onPressed: () => changeTab('profile'),
              icon: Image.asset(
                './assets/images/icons/person-icon.png',
                width: 48,
                height: 48,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: IconButton(
              onPressed: () => changeTab('settings'),
              icon: Image.asset(
                './assets/images/icons/settings-icon.png',
                width: 28,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
