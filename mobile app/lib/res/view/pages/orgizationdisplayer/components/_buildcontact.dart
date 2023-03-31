import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';

List<Widget> buildContacts(List<String> contacts, dynamic lang) {
  List<Widget> children = [];
  children.add(Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 15),
    child: Text(
      capitalize(lang.contact),
      style: const TextStyle(
          color: textPrimary, fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ));
  if (contacts.isEmpty) {
    children.add(Text(
      lang.noContactAvailable,
      style: const TextStyle(color: textSecondary, fontSize: 10),
    ));
  } else {
    for (String contact in contacts) {
      children.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: Text(
            contact,
            style: const TextStyle(color: Colors.blue, fontSize: 10),
          ),
        ),
      );
    }
  }
  return children;
}
