import 'package:flutter/material.dart';

import '../../../data/repository/firestore service/firestore_services.dart';
import '../../../domain/model/leave_model.dart';
import '../../utils/app_styles.dart';

class LeaveScreen extends StatelessWidget {
  const LeaveScreen({Key? key}) : super(key: key);

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
              "Leave Data",
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
            StreamBuilder(
                stream: FirestoreServices().streamLeave(),
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

                  List<LeaveModel> leaveData = [];

                  for (var element in snapshot.data!.docs) {
                    leaveData.add(element.data());
                  }

                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: leaveData.length,
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
                                  "0110219085",
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Rafi Ramadhana",
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "ramadhanarafi437@gmail.com",
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Mobile Developer",
                                  style: kPoppinsRegular,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "083866379756",
                                  style: kPoppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
            // RecentFiles(),
          ],
        ),
      ),
    );
  }
}
