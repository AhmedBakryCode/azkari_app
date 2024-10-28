import 'package:Islami/core/utils/assets.dart';
import 'package:Islami/presentation_layer/home_page/componenet/azkar_item.dart';
import 'package:flutter/material.dart';

class AzkarListItem extends StatelessWidget {
  const AzkarListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> azkardata = [
      ["Morning Azkar", ImageAssets.morning_azkar],
      ["EveningAzkar", ImageAssets.evening_azkar]
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: azkardata.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 15,crossAxisSpacing: 15),
          itemBuilder: (context, index) => AzkarItem(
            index: index,
              imagepath: azkardata[index][1].toString(),
              type: azkardata[index][0].toString())),
    );
  }
}
