import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/api/models/organization.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<dynamic>> getData(String searchText) async {
  var response = await apiService.getSearchResponses(searchText);
  List<dynamic> assets = [];
  if (response.containsKey('object')) {
    for (var asset in response["object"]) {
      if (asset['type'] == 'document') {
        assets.add(Document.fromJson(asset['content']));
      } else if (asset['type'] == 'organization') {
        assets.add(Organization.fromJson(asset['content']));
      } else {
        assets.add(Article.fromJson(asset['content']));
      }
    }
  } else if (response.containsKey("error")) {
    print(response["error"]);
  } else {
    print(response["message"]);
  }

  return assets;
}
