import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_styles.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.amountOfFiles,
  }) : super(key: key);

  final String title, svgSrc, amountOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kPoppinsRegular,
                  ),
                  Text(
                    "Status",
                    style: kPoppinsRegular.copyWith(
                        fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles)
        ],
      ),
    );
  }
}
