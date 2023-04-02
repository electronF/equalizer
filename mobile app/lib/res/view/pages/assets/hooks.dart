import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<dynamic>?> getData() async {
  var response = await apiService.getAssets();
  if (response.containsKey('object')) {
    List<dynamic> assets = [];
    for (var asset in response["object"]) {
      if (asset['type'] == 'document') {
        assets.add(documentFromJson(asset['content']));
      } else {
        assets.add(articleFromJson(asset['content']));
      }
    }

    return assets;
  } else if (response.containsKey("error")) {
    print(response["error"]);
  } else {
    print(response["message"]);
  }
  return null;
}
