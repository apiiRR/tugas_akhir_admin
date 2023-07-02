import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/bloc/bloc/setting_bloc.dart';
import '../../../data/repository/firestore service/firestore_services.dart';
import '../../utils/app_styles.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/textfield_with_label.dart';
import '../../widgets/time_picker_with_label.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final _formKeyLocation = GlobalKey<FormBuilderState>();
  final _formKeyTime = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: StreamBuilder(
            stream: FirestoreServices().streamSetting(),
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

              Map<String, dynamic>? leaveData = snapshot.data!.data();

              return Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Setting Location",
                            style: kPoppinsSemibold.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          child: FormBuilder(
                            key: _formKeyLocation,
                            child: Column(
                              children: [
                                TextFieldWithLabel(
                                  label: "Latitude",
                                  name: "lat",
                                  validator: FormBuilderValidators.required(),
                                  initialValue: leaveData!["lat"],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWithLabel(
                                  label: "Longitude",
                                  name: "long",
                                  validator: FormBuilderValidators.required(),
                                  initialValue: leaveData["long"],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                RoundedButton(
                                  onPressed: () {
                                    _formKeyLocation.currentState!.save();
                                    if (_formKeyLocation.currentState!
                                        .validate()) {
                                      context.read<SettingBloc>().add(
                                          SettingLocation(
                                              _formKeyLocation
                                                  .currentState!.value["long"]
                                                  .toString(),
                                              _formKeyLocation
                                                  .currentState!.value["lat"]
                                                  .toString()));
                                    }
                                  },
                                  child:
                                      BlocConsumer<SettingBloc, SettingState>(
                                    listener: (context, state) {
                                      if (state is SettingComplete) {
                                        context.pop();
                                      }
                                      if (state is SettingError) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(state.message),
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is SettingLoading) {
                                        return const SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            color: primaryWhite,
                                          ),
                                        );
                                      }

                                      return textDefaultRoundedButton("Update");
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      // RecentFiles(),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: kPoppinsSemibold.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        color: secondaryColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 10),
                          child: FormBuilder(
                            key: _formKeyTime,
                            child: Column(
                              children: [
                                TimePickerWithLabel(
                                  label: "Check In",
                                  name: "in",
                                  initialValue: TimeOfDay(
                                      hour: int.parse(leaveData["checkIn"]
                                          .toString()
                                          .substring(0, 2)),
                                      minute: int.parse(leaveData["checkIn"]
                                          .toString()
                                          .substring(3, 5))),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TimePickerWithLabel(
                                    label: "Check Out",
                                    name: "out",
                                    initialValue: TimeOfDay(
                                        hour: int.parse(leaveData["checkOut"]
                                            .toString()
                                            .substring(0, 2)),
                                        minute: int.parse(leaveData["checkOut"]
                                            .toString()
                                            .substring(3, 5)))),
                                const SizedBox(
                                  height: 16,
                                ),
                                RoundedButton(
                                  onPressed: () {
                                    _formKeyTime.currentState!.save();
                                    if (_formKeyTime.currentState!.validate()) {
                                      context.read<SettingBloc>().add(
                                          SettingTime(
                                              DateFormat.Hm().format(
                                                  _formKeyTime.currentState!
                                                      .value["in"]),
                                              DateFormat.Hm().format(
                                                  _formKeyTime.currentState!
                                                      .value["out"])));
                                    }
                                  },
                                  child:
                                      BlocConsumer<SettingBloc, SettingState>(
                                    listener: (context, state) {
                                      if (state is SettingComplete) {
                                        context.pop();
                                      }
                                      if (state is SettingError) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(state.message),
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is SettingLoading) {
                                        return const SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            color: primaryWhite,
                                          ),
                                        );
                                      }

                                      return textDefaultRoundedButton("Update");
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      // RecentFiles(),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
