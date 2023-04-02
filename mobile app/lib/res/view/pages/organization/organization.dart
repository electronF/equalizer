import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/pages/organization/components/_buildorganizationlist.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';

import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/en_en.dart' as en_lang;

import 'package:mapiol/res/view/pages/organization/hooks.dart' as hooks;

class OrganizationPage extends StatefulWidget {
  const OrganizationPage(
      {super.key, required this.title, required this.language});

  final String title;
  final String language;

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
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
    return Scaffold(
        appBar: appBar(capitalize(widget.title)),
        backgroundColor: primaryLight,
        body: Container(
          margin: const EdgeInsets.only(top: 2),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: hooks.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    "${snapshot.data!}",
                    style: const TextStyle(color: textPrimary, fontSize: 12),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                      children: buildOrganizationList(
                          snapshot.data!, widget.language, lang, context));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }
}
