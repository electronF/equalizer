import 'package:flutter/material.dart';
import 'package:mapiol/res/api/database/database.dart';
import 'package:mapiol/res/api/models/message.dart';
import 'package:mapiol/res/utils/datetimefunctions.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/constants/colors.dart';
import 'package:mapiol/res/view/pages/chatbot/components/_buildmessagegroup.dart';
import 'package:mapiol/res/view/pages/chatbot/hooks.dart' as hooks;
import 'package:mapiol/res/view/uix/components/messageframe.dart';
import 'package:mapiol/res/view/uix/modules/appbar.dart';
import 'package:mapiol/res/view/lang/fr_fr.dart' as fr_lang;
import 'package:mapiol/res/view/lang/fr_fr.dart' as en_lang;

class ChatBotPage extends StatefulWidget {
  const ChatBotPage(
      {super.key,
      required this.title,
      required this.language,
      required this.userId});

  final String title;
  final String language;
  final String userId;

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _messageField = TextEditingController();

  String _messageFieldText = '';
  // ignore: prefer_final_fields
  bool _isRecording = false;
  FocusNode _focusNode = new FocusNode();
  bool _isLoaded = false;
  var lang = en_lang.Lang();
  String senderId = 'bot';

  var border = const OutlineInputBorder(
      borderSide: BorderSide(width: 0, color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(30)));
  List<Message> _messages = [];
  Message? _prevMessage;

  @override
  void initState() {
    if (widget.language == 'en') {
      lang = en_lang.Lang();
    } else if (widget.language == 'fr') {
      lang = fr_lang.Lang();
    }

    print("isolated: $_isLoaded");
    _getAllMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(capitalize(widget.title)),
      backgroundColor: primaryLight,
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: (_isLoaded == true)
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _messages.length,
                      itemBuilder: (context, index) =>
                          _displayMessageInStack(context, index))
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.25,
                      color: Colors.transparent,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          color: primaryDark,
                        ),
                      ),
                    ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 2, bottom: 8, left: 8, right: 8),
            child: Form(
              key: formKey,
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 40 +
                          30 *
                              ((RegExp(r'(\n)').allMatches(_messageFieldText))
                                  .length) *
                              1.0,
                      child: TextFormField(
                        controller: _messageField,
                        focusNode: _focusNode,
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        onChanged: (value) => _messageFieldText = value,
                        validator: (value) => (value!.trim().length > 0)
                            ? null
                            : "This field can be empty",
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: background,
                          border: border,
                          hintText: lang.message,
                          focusedBorder: border,
                          enabledBorder: border,
                          disabledBorder: border,
                          errorBorder: border,
                          suffixIcon: IconButton(
                              onPressed: _changeRecordingState,
                              icon: _recordIcon(_isRecording)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16.5),
                          hintStyle: const TextStyle(
                              color: textSecondary,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: _sendMessage,
                    child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                          color: Color(0xFF10655D),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.send,
                            color: background,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _recordIcon(bool isRecording) {
    if (!isRecording) {
      return const Icon(
        Icons.mic_rounded,
        size: 20,
        color: primary,
      );
    } else {
      return const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Icon(
          Icons.remove_circle,
          size: 32,
          color: accent,
        ),
      );
    }
  }

  _displayMessageInStack(BuildContext context, int index) {
    Row? row;

    if (_messages[index].senderId.toLowerCase().trim() ==
            widget.userId.toLowerCase().trim() ||
        _prevMessage == null) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MessageFrame(
            textColor: textPrimary,
            bgColor: background,
            dateTime:
                toUTCDateTimeString(_messages[index].dateTime, widget.language),
            text: _messages[index].text,
          )
        ],
      );
    } else {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MessageFrame(
            textColor: background,
            bgColor: primary,
            dateTime:
                toUTCDateTimeString(_messages[index].dateTime, widget.language),
            text: _messages[index].text,
          )
        ],
      );
    }

    _prevMessage = _messages[index];

    if (_prevMessage?.senderId.toLowerCase().trim() !=
        _messages[index].senderId.toLowerCase().trim()) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: row,
      );
    }

    return row;
  }

  _changeRecordingState() {
    setState(() {
      _isRecording = !_isRecording;
    });
  }

  _sendMessage() async {
    FocusManager.instance.primaryFocus?.unfocus();

    Message sendMessage = Message(
        senderId: widget.userId,
        dateTime: DateTime.now().toIso8601String(),
        text: _messageFieldText);
    int id = await DBProvider.db.addMessage(sendMessage);
    sendMessage.id = id;
    setState(() {
      _messages.add(sendMessage);
    });

    Message? message =
        await hooks.sendMessage(_messageFieldText, widget.userId);
    if (message != null) {
      message.senderId = senderId;
      int id = await DBProvider.db.addMessage(message);
      message.id = id;

      setState(() {
        _messages.add(message);
      });
    }

    _messageField.clear();
  }

  _getAllMessage() async {
    var messages = await DBProvider.db.getAllMessages();
    _messages.addAll(messages);

    // _messages.forEach(
    //   (element) => print(element.toJson()),
    // );

    setState(() {
      _isLoaded = true;
    });

    // await DBProvider.db.deleteAllMessages();
  }
}
