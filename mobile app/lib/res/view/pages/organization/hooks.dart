import 'package:mapiol/res/api/database/database.dart';
import 'package:mapiol/res/api/models/organization.dart';
import 'package:mapiol/res/services/apiService.dart';

ApiService apiService = ApiService();

Future<List<Organization>> getData() async {
  var response1 = await apiService.getOrganizations();
  var response2 = await DBProvider.db.getAllOrganization();
  List<Organization> organizations = [];
  Map<String, Organization> organizationsMap = {};

  for (Organization organization in response2) {
    organizations.add(organization);
    organizationsMap[organization.name.toLowerCase().trim()] = organization;
  }

  if (response1.containsKey('object')) {
    for (var organizationObj in response1["object"]) {
      Organization organization = Organization.fromJson(organizationObj);
      if (!organizationsMap
          .containsKey(organization.name.toLowerCase().trim())) {
        organizations.add(organization);
      }
    }
    return organizations;
  } else if (response1.containsKey("error")) {
    print(response1["error"]);
  } else {
    print(response1["message"]);
  }
  return organizations;
}
