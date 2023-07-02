import 'package:admin/domain/model/profile_model.dart';
import 'package:admin/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../core/bloc/user/user_bloc.dart';
import '../../utils/app_styles.dart';
import '../../widgets/rounded_button.dart';
import '../../widgets/textfield_with_label.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add New Employee",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWithLabel(
                        label: "Employee Id",
                        name: "id",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWithLabel(
                        label: "Full Name",
                        name: "name",
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWithLabel(
                        label: "Email Address",
                        name: "email",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWithLabel(
                        label: "Phone Number",
                        name: "phone",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWithLabel(
                        label: "Position",
                        name: "position",
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RoundedButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            context.read<UserBloc>().add(UserAddData(
                                ProfileModel(
                                    email: _formKey.currentState!.value["email"]
                                        .toString(),
                                    employeeId: _formKey
                                        .currentState!.value["id"]
                                        .toString(),
                                    name: _formKey.currentState!.value["name"]
                                        .toString(),
                                    phone: _formKey.currentState!.value["phone"]
                                        .toString(),
                                    position: _formKey
                                        .currentState!.value["position"]
                                        .toString(),
                                    photo: null,
                                    createdAt: null,
                                    uid: null)));
                          }
                        },
                        child: BlocConsumer<UserBloc, UserState>(
                          listener: (context, state) {
                            if (state is UserComplete) {
                              context.pop();
                            }
                            if (state is UserError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is UserLoading) {
                              return const SizedBox(
                                height: 14,
                                width: 14,
                                child: CircularProgressIndicator(
                                  color: primaryWhite,
                                ),
                              );
                            }

                            return textDefaultRoundedButton("Add");
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
      ),
    );
  }
}
