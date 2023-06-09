import 'package:flutter/material.dart';
import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/api/models/organization.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/pages/articledisplayer/articledisplayer.dart';
import 'package:mapiol/res/view/pages/orgizationdisplayer/organizationdisplayer.dart';
import 'package:mapiol/res/view/uix/components/itemdescriptionframe.dart';

List<ItemDescriptionFrame> buildRestultItems(
    List<dynamic> assets, String language, dynamic lang, BuildContext context) {
  List<ItemDescriptionFrame> children = [];

  for (var asset in assets) {
    if (asset.runtimeType == Document) {
      children.add(
        ItemDescriptionFrame(
          titleBarTitle: '',
          displayTitleBarTitle: false,
          titleBarSubtitle: (asset as Document).type.toUpperCase(),
          title: (asset as Document).title,
          textBody: capitalize((asset as Document).shortDescription),
          onTap: () {
            //ToDo open download page
          },
        ),
      );
    } else if (asset.runtimeType == Article) {
      children.add(
        ItemDescriptionFrame(
          titleBarTitle: (asset as Article).sourceName,
          titleBarSubtitle: (asset as Article).sourceLink ?? "",
          displayTitleBarSubtitle:
              ((asset as Article).sourceLink != null) ? true : false,
          title: (asset as Article).title,
          textBody: capitalize((asset as Article).shortDescription),
          onTap: () {
            var articleTitle =
                "${(asset as Article).title.substring(0, 15)}...";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDisplayerPage(
                  title: articleTitle,
                  articleTitle: capitalize((asset as Article).title),
                  titleBarTitle: (asset as Article).sourceName,
                  titleBarSubtitle: (asset as Article).sourceLink ?? "",
                  displayTitleBarSubtitle:
                      ((asset as Article).sourceLink != null) ? true : false,
                  textBody: (asset as Article).content,
                  language: language,
                  references: (asset as Article).references,
                  // image: (asset as Article).image, Load base64 image here
                ),
              ),
            );
          },
        ),
      );
    } else if (asset.runtimeType == Organization) {
      children.add(
        ItemDescriptionFrame(
          titleBarTitle: (asset as Organization).name,
          titleBarSubtitle: (asset as Organization).type,
          title: lang.objective,
          textBody: (asset as Organization).shortDescription,
          onTap: () {
            var articleTitle =
                "${(asset as Organization).name.substring(0, 15)}...";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrganizationDisplayerPage(
                  title: articleTitle,
                  articleTitle: lang.objective,
                  titleBarTitle: (asset as Organization).name,
                  titleBarSubtitle: (asset as Organization).type,
                  textBody: (asset as Organization).fullDescription,
                  language: language,
                  contacts: (asset as Organization).contacts,
                  adresses: (asset as Organization).adresses,
                  socialMedia: (asset as Organization).socialMedia,
                  // image: organization.image, Load base64 image here
                ),
              ),
            );
          },
        ),
      );
    }
  }

  return children;
}
