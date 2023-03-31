import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';

List<Widget> buildAdresses(List<String> adresses, dynamic lang) {
  List<Widget> children = [];
  children.add(Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 15),
    child: Text(
      capitalize(lang.adress),
      style: const TextStyle(
          color: textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ));
  if (adresses.isEmpty) {
    children.add(Text(
      lang.noAdressAvailable,
      style: const TextStyle(color: textSecondary, fontSize: 10),
    ));
  } else {
    for (String adress in adresses) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: Text(
            adress,
            style: const TextStyle(color: Colors.blue, fontSize: 10),
          ),
        ),
      );
    }
  }
  return children;
}
