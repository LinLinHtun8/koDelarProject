import 'package:flutter/material.dart';
import 'package:kodlrprojec/Screen/mobileScreen/firstSliderbar.dart';
import 'package:kodlrprojec/Screen/mobileScreen/itemMenuBar.dart';
import 'package:kodlrprojec/Screen/mobileScreen/promotionitems.dart';
import 'package:kodlrprojec/constants/appconstants.dart';

class MainMobileScreen extends StatelessWidget {
  const MainMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Firstsliderbar(images: bankKnowledgeList),
          SizedBox(height: 10),
          titleWidget("Top Categories"),
          ItemMenuBar(),
          SizedBox(height: 10),
          titleWidget("Promotional Products"),
          PromotionItems(items: promotionItemsList),
        ],
      ),
    );
  }
}

Widget titleWidget(String s) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      s,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
      softWrap: true,
    ),
  );
}
