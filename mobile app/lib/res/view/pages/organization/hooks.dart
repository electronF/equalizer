import 'package:mapiol/res/api/models/organization.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<Organization>?> getData() async {
  var response = await apiService.getOrganizations();
  if (response.containsKey('object')) {
    List<Organization> organizations = [];
    for (var organization in response["object"]) {
      organizations.add(organizationFromJson(organization));
    }
    return organizations;
  } else if (response.containsKey("error")) {
    print(response["error"]);
  } else {
    print(response["message"]);
  }
  return null;
}
