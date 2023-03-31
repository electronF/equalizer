// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/pages/articledisplayer/articledisplayer.dart';
import 'package:mapiol/res/view/pages/search/components/_buildresultitems.dart';
import 'package:mapiol/res/view/pages/search/hooks.dart' as hooks;
import 'package:mapiol/res/view/uix/components/itemdescriptionframe.dart';
import 'package:mapiol/res/view/uix/components/searchmenuitem.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';

import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/en_en.dart' as en_lang;

class SearchPage extends StatefulWidget {
  SearchPage({super.key, required this.title, required this.language});

  final String title;
  final String language;
  final TextEditingController _searchField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // ignore: unused_field
  String _searchFieldText = '';
  dynamic lang = en_lang.Lang();
  final _focusNode = FocusNode();

  var border = const OutlineInputBorder(
      borderSide: BorderSide(width: 0, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(8)));

  bool _isSearching = false;

  // ignore: avoid_init_to_null
  Widget? searchResultItem = null;

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
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryLight,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 21, bottom: 5),
            margin: const EdgeInsets.only(bottom: 2),
            color: background,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 26),
                child: Form(
                  key: widget._formKey,
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            controller: widget._searchField,
                            focusNode: _focusNode,
                            textAlign: TextAlign.left,
                            validator: (value) =>
                                ((value ?? "").trim().isNotEmpty) ? null : '',
                            onChanged: (value) => _searchFieldText = value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: primary,
                              border: border,
                              focusedBorder: border,
                              enabledBorder: border,
                              disabledBorder: border,
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
                            style: const TextStyle(
                                color: background, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 17),
                    child: SearchMenuItem(
                        itemName: lang.all, itemColor: primary, isActive: true),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 17),
                    child: SearchMenuItem(
                        itemName: lang.documents,
                        itemColor: primary,
                        isActive: false),
                  ),
                ],
              )
            ]),
          ),
          SingleChildScrollView(child: _buildResultItems())
        ],
      ),
    );
  }

  _search(String searchText) async {
    setState(() {
      _isSearching = true;
    });

    var response = await hooks.getData(searchText);
    searchResultItem = buildRestultItems(response, widget.language);
    setState(() {
      _isSearching = true;
    });
  }

  Widget? _buildResultItems() {
    if (_isSearching == true) {
      return const Padding(
          padding: EdgeInsets.only(top: 10),
          child: CircularProgressIndicator());
    } else {
      return searchResultItem;
    }
  }
}
