import 'package:flutter/widgets.dart';

class MessageGroup extends StatelessWidget {
  const MessageGroup(
      {super.key,
      required this.children,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.max,
        children: children,
      ),
    );
  }
}
