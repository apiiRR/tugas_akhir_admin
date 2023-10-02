import 'package:flutter/material.dart';
import 'package:admin/models/MyFiles.dart';
import '../../../utils/app_styles.dart';
import '../../../responsive.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "title": "Attedance",
        "data": 5,
        "svg": "assets/icons/Documents.svg",
        "color": primaryColor,
        "percentage": 10,
      },
      {
        "title": "Leave",
        "data": 1,
        "svg": "assets/icons/google_drive.svg",
        "color": Color(0xFFFFA113),
        "percentage": 5,
      },
      {
        "title": "User",
        "data": 10,
        "svg": "assets/icons/one_drive.svg",
        "color": Color(0xFFA4CDFF),
        "percentage": 20,
      }
    ];
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) => FileInfoCard(
          color: data[index]["color"],
          data: data[index]["data"],
          percentage: data[index]["percentage"],
          svg: data[index]["svg"],
          title: data[index]["title"]),
    );
  }
}
