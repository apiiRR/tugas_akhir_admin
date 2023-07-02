import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../utils/app_styles.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel(
      {super.key,
      required this.label,
      required this.name,
      this.hintText,
      this.validator,
      this.isPassword = false,
      this.isReadOnly = false,
      this.maxLines = 1,
      this.initialValue,
      this.keyboardType});

  final String label;
  final String name;
  final String? hintText;
  final bool isPassword;
  final bool isReadOnly;
  final int maxLines;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: kPoppinsRegular,
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
              color: primaryGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6)),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: FormBuilderTextField(
              cursorColor: primaryWhite,
              validator: validator,
              obscureText: isPassword,
              maxLines: maxLines,
              readOnly: isReadOnly,
              name: name,
              initialValue: initialValue,
              style: kPoppinsRegular.copyWith(fontSize: 14),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                hintText: hintText,
                hintStyle: kPoppinsRegular.copyWith(
                    fontSize: 14, color: primaryBlack.withOpacity(0.5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryWhite, width: 2),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: primaryWhite, width: 2),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
