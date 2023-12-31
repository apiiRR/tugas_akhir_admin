import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

const primaryGrey = Color(0xFF858585);
const secondaryGrey = Color(0xFFDADADA);
const thirdGrey = Color(0xFFECECEC);

const primaryWhite = Color(0xFFFFFFFF);
const primaryBlack = Color(0xFF000000);

const primaryRed = Color(0xFFE44646);
const secondaryRed = Color(0xFFFFE6E6);

const kPaddingHorizontal = 16.0;

final kPoppinsBold = GoogleFonts.poppins(
  fontWeight: FontWeight.w700,
);

final kPoppinsSemibold = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
);

final kPoppinsMedium = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
);

final kPoppinsRegular = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
);

final kPoppinsLight = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
);

Text textDefaultRoundedButton(String text, {Color color = primaryWhite}) {
  return Text(
    text,
    style: kPoppinsBold.copyWith(fontSize: 16, color: color),
  );
}
