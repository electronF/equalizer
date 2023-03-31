import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/en_en.dart' as en_lang;
import 'package:mapiol/res/view/pages/assets/assets.dart';
import 'package:mapiol/res/view/pages/chatbot/chatbot.dart';
import 'package:mapiol/res/view/pages/home/components/_menuitems.dart';
import 'package:mapiol/res/view/pages/organization/organization.dart';
import 'package:mapiol/res/view/pages/search/search.dart';
import 'package:mapiol/res/view/pages/settings/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.title,
      required this.language,
      required this.userId});

  final String title;
  final String language;
  final String userId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentNavBarIndex = 1;
  double iconSize = 38;
  dynamic lang = en_lang.Lang();

  @override
  void initState() {
    if (widget.language == 'en') {
      lang = en_lang.Lang();
    } else if (widget.language == 'fr') {
      lang = fr_lang.Lang();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double distance = min(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: primaryDark,
      body: Stack(
        children: [
          Positioned(
            top: 177,
            left: -120,
            child: Container(
              width: distance,
              height: distance,
              transform: Matrix4.rotationZ(-0.4538 * 2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(58),
                gradient: const LinearGradient(
                    transform: GradientRotation(2.339),
                    stops: [0.2, 1],
                    colors: [Color(0xFFB2DFDB), Color(0xFF04F1D5)]),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 42, left: 36),
                    width: 344,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            lang.homePageTitle,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          lang.homePageMessage,
                          textAlign: TextAlign.left,
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.only(top: 2 * 26),
                      child: menuItems(lang, _onTapMenuItem),
                    ),
                  ),
                  // menuBar(context, iconSize, _changeTab)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: unused_element
  _changeTab(String buttonName) {
    setState(() {});
    if (buttonName == 'home') {}
  }

  _onTapMenuItem(String itemName) {
    switch (itemName) {
      case 'search':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(
              title: lang.search,
              language: widget.language,
            ),
          ),
        );
        break;
      case 'person-group':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrganizationPage(
              title: lang.helpGroup,
            ),
          ),
        );
        break;
      case 'submit-problem':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatBotPage(
              title: lang.submitProblem,
              language: widget.language,
              userId: widget.userId,
            ),
          ),
        );
        break;
      case 'some-assets':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetsPage(
              title: lang.someAssets,
              language: widget.language,
            ),
          ),
        );
        break;
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SettingsPage(
              title: lang.settings,
            ),
          ),
        );
        break;
    }
  }
}
