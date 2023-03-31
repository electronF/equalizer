import 'package:flutter/material.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({super.key, required this.title});

  final String title;

  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  @override
  void initState() {
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
            child: Column(children: []),
          ),
        ));
  }
}
