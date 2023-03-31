import 'package:flutter/material.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/constants/texts.dart';
import 'package:mapiol/res/view/pages/home/home.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key, required this.title});

  final String title;

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  bool canStartAnimateFlow = false;
  bool canStartAnimateAddenda = false;
  bool canStartAnimatedCompagny = false;
  String compagnyText = "";
  String language = "en";
  String userId = "unknow";

  @override
  void initState() {
    super.initState();
    _runAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(child: Image.asset("assets/images/icons/logo.png")),
          ),
        ),
        Positioned(
          bottom: 52.5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(poweredBy,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: primaryDark)),
            ),
          ),
        ),
      ],
    ));
  }

  _runAnimation() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            title: "Home Page",
            language: language,
            userId: userId,
          ),
        ),
      );
    });
  }
}
