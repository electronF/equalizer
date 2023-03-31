import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/pages/orgizationdisplayer/components/_buildmaincontaint.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';

import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/fr_fr.dart' as en_lang;

class ArticleDisplayerPage extends StatefulWidget {
  const ArticleDisplayerPage(
      {super.key,
      required this.title,
      required this.articleTitle,
      required this.titleBarTitle,
      required this.titleBarSubtitle,
      required this.textBody,
      this.references = const [],
      this.image,
      this.displayTitleBarTitle = true,
      this.displayTitleBarSubtitle = true,
      this.bgColor = background,
      required this.language});

  final Widget? image;
  final String title;
  final String articleTitle;
  final String titleBarTitle;
  final String titleBarSubtitle;
  final String textBody;
  final List<String> references;
  final bool displayTitleBarSubtitle;
  final bool displayTitleBarTitle;
  final Color bgColor;
  final String language;

  @override
  State<ArticleDisplayerPage> createState() => _ArticleDisplayerPageState();
}

class _ArticleDisplayerPageState extends State<ArticleDisplayerPage> {
  // ignore: prefer_final_fields
  var lang = en_lang.Lang();

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
    return Scaffold(
      appBar: appBar(capitalize(widget.title)),
      backgroundColor: primaryLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: widget.bgColor,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 2, bottom: 5),
              padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildMainContent(
                      widget.displayTitleBarTitle,
                      widget.displayTitleBarSubtitle,
                      widget.image,
                      widget.titleBarTitle,
                      widget.titleBarSubtitle),
                  Padding(
                    padding: EdgeInsets.only(
                        top: (widget.title.trim().isNotEmpty) ? 11 : 0),
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: (widget.title.trim().isNotEmpty) ? 11 : 0),
                    child: Text(
                      widget.textBody,
                      textAlign: TextAlign.left,
                      style: const TextStyle(color: textPrimary, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: widget.bgColor,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 13),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          capitalize(lang.reference),
                          style: const TextStyle(
                              color: textPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ] +
                    ((widget.references.isEmpty)
                        ? [
                            Text(
                              lang.noRefenceAvailable,
                              style: const TextStyle(
                                  color: textSecondary, fontSize: 10),
                            )
                          ]
                        : [
                            for (String reference in widget.references)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7.5),
                                child: Text(
                                  reference,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 10),
                                ),
                              )
                          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
