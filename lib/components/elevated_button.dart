import 'package:flutter/material.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';

class MyElevatedButton extends StatelessWidget {
  final String titleText;
  final void Function()? onPressed;

  const MyElevatedButton({
    super.key,
    required this.titleText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomTheme.darkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          titleText,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
