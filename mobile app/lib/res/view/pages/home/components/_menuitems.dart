import 'package:flutter/material.dart';
import 'package:mapiol/res/view/uix/components/menuframe.dart';

menuItems(dynamic lang, void Function(String itemName) onTap) {
  return Column(
    // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: MenuFrame(
                onTap: () => onTap('search'),
                title: lang.search,
                icon: Image.asset(
                  "./assets/images/icons/search-icon-3.png",
                  width: 42,
                  height: 42,
                ),
              ),
            ),
            MenuFrame(
              onTap: () => onTap('person-group'),
              title: lang.helpGroup,
              icon: Image.asset(
                "./assets/images/icons/person-group-icon.png",
                width: 48,
                height: 48,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: MenuFrame(
                onTap: () => onTap('submit-problem'),
                title: lang.submitProblem,
                icon: Image.asset(
                  "./assets/images/icons/chat-icon.png",
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            MenuFrame(
              onTap: () => onTap('some-assets'),
              title: lang.someAssets,
              icon: Image.asset(
                "./assets/images/icons/documents-icon.png",
                width: 48,
                height: 48,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: MenuFrame(
                onTap: () => onTap('settings'),
                title: lang.settings,
                icon: Image.asset(
                  "./assets/images/icons/settings-icon.png",
                  width: 48,
                  height: 48,
                ),
              ),
            ),
            // Container(
            //   width: 160,
            //   height: 180,
            // )
          ],
        ),
      ),
    ],
  );
}
