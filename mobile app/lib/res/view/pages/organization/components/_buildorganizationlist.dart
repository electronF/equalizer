import 'package:flutter/material.dart';
import 'package:mapiol/res/api/models/organization.dart';
import 'package:mapiol/res/view/pages/orgizationdisplayer/organizationdisplayer.dart';
import 'package:mapiol/res/view/uix/components/itemdescriptionframe.dart';

List<ItemDescriptionFrame> buildOrganizationList(
    List<Organization> organizations,
    String language,
    dynamic lang,
    BuildContext context) {
  List<ItemDescriptionFrame> children = [];

  for (var organization in organizations) {
    children.add(
      ItemDescriptionFrame(
        titleBarTitle: organization.name,
        titleBarSubtitle: organization.type,
        title: lang.objective,
        textBody: organization.shortDescription,
        onTap: () {
          var articleTitle = "${organization.name.substring(0, 15)}...";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrganizationDisplayerPage(
                title: articleTitle,
                articleTitle: lang.objective,
                titleBarTitle: organization.name,
                titleBarSubtitle: organization.type,
                textBody: organization.fullDescription,
                language: language,
                contacts: organization.contacts,
                adresses: organization.adresses,
                socialMedia: organization.socialMedia,
                // image: organization.image, Load base64 image here
              ),
            ),
          );
        },
      ),
    );
  }

  return children;
}
