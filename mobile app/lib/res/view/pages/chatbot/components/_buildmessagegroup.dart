import 'package:flutter/material.dart';
import 'package:mapiol/res/api/models/message.dart';
import 'package:mapiol/res/utils/datetimefunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/uix/components/messageframe.dart';
import 'package:mapiol/res/view/uix/components/messagegroup.dart';

List<MessageGroup> buildMessageGroup(
    List<Message> messages, String userId, String language) {
  List<MessageGroup> children = [];
  messages.sort((a, b) =>
      DateTime.parse(a.dateTime).compareTo(DateTime.parse(b.dateTime)));
  List<Message> flagMessages = [];
  String prevId = "";
  for (Message message in messages.reversed) {
    if (message.senderId == prevId) {
      flagMessages.add(message);
    } else {
      if (prevId == userId) {
        children.add(
          MessageGroup(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (Message message in flagMessages)
                MessageFrame(
                  textColor: textPrimary,
                  bgColor: background,
                  dateTime: message.dateTime,
                  text: message.text,
                ),
            ],
          ),
        );
      } else {
        children.add(
          MessageGroup(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (Message message in flagMessages)
                MessageFrame(
                  textColor: background,
                  bgColor: primary,
                  dateTime: toUTCDateTimeString(message.dateTime, language),
                  text: message.text,
                ),
            ],
          ),
        );
      }
    }
  }

  return children;
}
