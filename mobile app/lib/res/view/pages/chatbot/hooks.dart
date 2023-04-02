import 'package:mapiol/res/api/models/message.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<Message>> getData(List<Message> messages) async {
  return messages;
}

Future<Message?> sendMessage(String message, String userId) async {
  //save message in internal database
  //send message to server
  print("message:$message userId:$userId");
  Message messageObj = Message(
      text: message,
      senderId: userId,
      dateTime: DateTime.now().toIso8601String());

  var response = await apiService.sendMessage(messageObj);
  if (response.containsKey("object")) {
    return Message.fromJson(response['object']);
  } else if (response.containsKey("error")) {
    print(response["error"]);
  } else {
    print(response["message"]);
  }
  return null;
}
