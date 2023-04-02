import 'package:flutter/material.dart';
import 'package:mapiol/res/api/models/article.dart';
import 'package:mapiol/res/api/models/document.dart';
import 'package:mapiol/res/utils/textfunctions.dart';
import 'package:mapiol/res/view/pages/articledisplayer/articledisplayer.dart';
import 'package:mapiol/res/view/uix/components/itemdescriptionframe.dart';

List<ItemDescriptionFrame> buildAssetsList(
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
    } else if (assets.runtimeType == Article) {
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
    }
  }

  return children;
}
