import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';

import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/fr_fr.dart' as en_lang;

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key, required this.title, required this.language});

  final String title;
  final String language;

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _searchField = TextEditingController();

  // ignore: unused_field
  String _searchFieldText = '';
  // ignore: prefer_final_fields
  var lang = en_lang.Lang();
  var border = const OutlineInputBorder(
      borderSide: BorderSide(width: 0, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(8)));

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
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
              margin: const EdgeInsets.only(bottom: 2),
              color: background,
              child: Form(
                key: formKey,
                child: Row(children: [
                  Flexible(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: _searchField,
                        textAlign: TextAlign.left,
                        validator: (value) =>
                            ((value ?? "").trim().isNotEmpty) ? null : '',
                        onChanged: (value) => _searchFieldText = value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: primary,
                          focusedBorder: border,
                          enabledBorder: border,
                          disabledBorder: border,
                          border: border,
                          hintText: lang.searchFieldPlaceHolder,
                          hintStyle: const TextStyle(
                              color: background,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(left: 15),
                    decoration: const BoxDecoration(
                        color: Color(0xFF10655D),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: MaterialButton(
                      onPressed: null,
                      color: const Color(0xFF10655D),
                      textColor: background,
                      focusColor: primary,
                      child: Text(
                        lang.searchButtonName,
                        style: const TextStyle(color: background, fontSize: 12),
                      ),
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
