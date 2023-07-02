import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/repository/firestore service/firestore_services.dart';
import '../../../domain/model/profile_model.dart';
import '../../../models/RecentFile.dart';
import '../../utils/app_styles.dart';
import '../../routes/router.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: FirestoreServices().streamProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryRed,
                ),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "Tidak ada data.",
                  style: kPoppinsRegular,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Tidak dapat mengambil data.",
                  style: kPoppinsRegular,
                ),
              );
            }

            List<ProfileModel> profileData = [];

            for (var element in snapshot.data!.docs) {
              profileData.add(element.data());
            }

            return SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Employee Data",
                        style: kPoppinsSemibold.copyWith(fontSize: 18),
                      ),
                      ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 14,
                          ),
                        ),
                        onPressed: () {
                          context.goNamed(Routes.createUserPage);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 18,
                        ),
                        label: Text(
                          "Add New",
                          style: kPoppinsRegular,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Employee Id",
                            style: kPoppinsMedium,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Name",
                            style: kPoppinsMedium,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Email",
                            style: kPoppinsMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Position",
                            style: kPoppinsMedium,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Phone",
                            style: kPoppinsMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: profileData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                                width: 2,
                                color: primaryColor.withOpacity(0.15)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  profileData[index].employeeId!,
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  profileData[index].name,
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  profileData[index].email,
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  profileData[index].position,
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  profileData[index].phone,
                                  style: kPoppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  // RecentFiles(),
                ],
              ),
            );
          }),
    );
  }
}

class RecentFiles extends StatelessWidget {
  const RecentFiles({
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
      child: SizedBox(
        width: double.infinity,
        child: DataTable(
          columnSpacing: defaultPadding,
          // minWidth: 600,
          columns: [
            DataColumn(
              label: Text("File Name"),
            ),
            DataColumn(
              label: Text("Date"),
            ),
            DataColumn(
              label: Text("Size"),
            ),
          ],
          rows: List.generate(
            demoRecentFiles.length,
            (index) => recentFileDataRow(demoRecentFiles[index]),
          ),
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon!,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
