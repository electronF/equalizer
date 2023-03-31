import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapiol/res/view/constants/colors.dart';

class MenuFrame extends StatelessWidget {
  const MenuFrame(
      {super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: 160,
            height: 180,
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 14),
            decoration: BoxDecoration(
                color: primary.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(17))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    gradient: LinearGradient(
                      transform: GradientRotation(2.321 - 3.14 / 2),
                      stops: [0.0, .8],
                      colors: [Color(0xFF94E6DC), Color(0xFF02C8B1)],
                    ),
                  ),
                  child: Center(child: icon),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: background, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
