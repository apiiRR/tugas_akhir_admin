import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Attendance Statistics",
            style: kPoppinsBold.copyWith(
              fontSize: 18,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "On Time",
            amountOfFiles: "1.3GB",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Overdue",
            amountOfFiles: "15.3GB",
          ),
        ],
      ),
    );
  }
}
