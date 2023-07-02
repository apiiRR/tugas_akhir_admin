import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../data/repository/firestore service/firestore_services.dart';
import '../../../domain/model/attedance_model.dart';
import '../../../domain/model/profile_model.dart';
import '../../../models/RecentFile.dart';
import '../../utils/app_styles.dart';
import '../../routes/router.dart';

class AttedanceScreen extends StatelessWidget {
  const AttedanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attedance Data",
              style: kPoppinsSemibold.copyWith(fontSize: 18),
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
                      "Date",
                      style: kPoppinsMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Employee Id",
                      style: kPoppinsMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Name",
                      style: kPoppinsMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Check In",
                      style: kPoppinsMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Check Out",
                      style: kPoppinsMedium,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Status",
                      style: kPoppinsMedium,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            StreamBuilder(
                stream: FirestoreServices().streamAttedance(),
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

                  List<AttedanceModel> attedanceData = [];

                  for (var element in snapshot.data!.docs) {
                    attedanceData.add(element.data());
                  }

                  return StreamBuilder(
                      stream: FirestoreServices().streamProfile(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: attedanceData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  border: Border.all(
                                      width: 2,
                                      color: primaryColor.withOpacity(0.15)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        DateFormat("d MMMM yyyy").format(
                                            attedanceData[index].checkIn.time),
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        profileData
                                            .firstWhere((element) =>
                                                element.uid ==
                                                attedanceData[index].userId)
                                            .employeeId,
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        profileData
                                            .firstWhere((element) =>
                                                element.uid ==
                                                attedanceData[index].userId)
                                            .name,
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        DateFormat("HH:mm").format(
                                            attedanceData[index].checkIn.time),
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        attedanceData[index].checkOut != null
                                            ? DateFormat("HH:mm").format(
                                                attedanceData[index]
                                                    .checkOut!
                                                    .time)
                                            : "--:--",
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        attedanceData[index].status == 1
                                            ? "On Time"
                                            : "Late",
                                        style: kPoppinsRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      });
                }),
            // RecentFiles(),
          ],
        ),
      ),
    );
  }
}
