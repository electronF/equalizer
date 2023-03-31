import 'dart:math';

import 'package:flutter/widgets.dart';

class MessageFrame extends StatelessWidget {
  const MessageFrame(
      {super.key,
      required this.textColor,
      required this.bgColor,
      required this.dateTime,
      this.audioSong,
      this.document,
      this.text,
      this.video});

  final Color textColor;
  final Color bgColor;
  final String? text;
  final Widget? audioSong;
  final Widget? video;
  final Widget? document;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      margin: const EdgeInsets.only(bottom: 3),
      width: min(max(_textLineMaxLength(text ?? "") * 12, 75),
          MediaQuery.of(context).size.width - 75),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text ?? "",
            style: TextStyle(color: textColor, fontSize: 12),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                dateTime,
                style:
                    TextStyle(color: textColor.withOpacity(.8), fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }

  int _textLineMaxLength(String text) {
    int maxLengt = 0;
    for (String textPart in text.split('\n')) {
      maxLengt = max(textPart.length, maxLengt);
    }
    return maxLengt;
  }
}
