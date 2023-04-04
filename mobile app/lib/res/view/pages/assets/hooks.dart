import 'package:mapiol/res/api/database/database.dart';
import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<dynamic>> getData() async {
  var response1 = await apiService.getAssets();
  List<dynamic> response2 = [];

  response2.addAll(await DBProvider.db.getAllArticles());
  response2.addAll(await DBProvider.db.getAllDocuments());

  List<dynamic> assets = [];

  Map<String, Map<String, dynamic>> assetsMap = {'document': {}, 'article': {}};
  for (dynamic asset in response2) {
    if (asset.runtimeType == Document) {
      assetsMap['document']![(asset as Document).title.toLowerCase().trim()] =
          assets;
    } else {
      assetsMap['document']![(asset as Article).title.toLowerCase().trim()] =
          assets;
    }
  }

  if (response1.containsKey('object')) {
    for (var asset in response1["object"]) {
      if (asset['type'] == 'document') {
        var assetObj = Document.fromJson(asset['content']);
        if (!assetsMap['document']!
            .containsKey(assetObj.title.toLowerCase().trim())) {
          assets.add(assetObj);
        }
      } else {
        var assetObj = Article.fromJson(asset['content']);
        if (!assetsMap['article']!
            .containsKey(assetObj.title.toLowerCase().trim())) {
          assets.add(assetObj);
        }
        assets.add(Article.fromJson(asset['content']));
      }
    }
  } else if (response1.containsKey("error")) {
    print(response1["error"]);
  } else {
    print(response1["message"]);
  }
  return assets;
}
