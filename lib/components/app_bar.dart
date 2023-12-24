import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: CustomTheme.lightBlue),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title, style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
  );
}
