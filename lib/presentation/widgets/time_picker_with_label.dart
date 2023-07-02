import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../utils/app_styles.dart';

class TimePickerWithLabel extends StatelessWidget {
  const TimePickerWithLabel({
    super.key,
    required this.label,
    required this.name,
    required this.initialValue,
  });

  final String label;
  final String name;
  final TimeOfDay initialValue;

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
          child: FormBuilderDateTimePicker(
            name: name,
            inputType: InputType.time,
            initialTime: initialValue,
            initialValue:
                DateTime(0001, 01, 01, initialValue.hour, initialValue.minute),
            style: kPoppinsRegular.copyWith(fontSize: 14),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
      ],
    );
  }
}
