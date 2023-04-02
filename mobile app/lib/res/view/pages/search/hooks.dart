import 'package:mapiol/res/api/models/message.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<dynamic> getData(String searchText) async {
  var result = await apiService.getSearchResponses(searchText);

  //loop and return as corresponding data
  return result;
}
