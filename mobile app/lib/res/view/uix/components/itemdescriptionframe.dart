import 'package:flutter/widgets.dart';
import 'package:mapiol/res/view/constants/colors.dart';

class ItemDescriptionFrame extends StatelessWidget {
  const ItemDescriptionFrame(
      {super.key,
      required this.titleBarTitle,
      required this.titleBarSubtitle,
      required this.title,
      required this.textBody,
      required this.onTap,
      this.image,
      this.displayTitleBarTitle = true,
      this.displayTitleBarSubtitle = true,
      this.bgColor = background});

  final Widget? image;
  final String titleBarTitle;
  final String titleBarSubtitle;
  final String title;
  final String textBody;
  final bool displayTitleBarSubtitle;
  final bool displayTitleBarTitle;
  final Color bgColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 13),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD3D3D3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: image ?? Container(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      (!displayTitleBarTitle)
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                titleBarTitle,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: textPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                      (!displayTitleBarSubtitle)
                          ? Container()
                          : Text(
                              titleBarSubtitle,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: textPrimary, fontSize: 10),
                            )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: (title.trim().isNotEmpty) ? 11 : 0),
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: (title.trim().isNotEmpty) ? 11 : 0),
              child: Text(
                textBody,
                textAlign: TextAlign.left,
                style: const TextStyle(color: textPrimary, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
