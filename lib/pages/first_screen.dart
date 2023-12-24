import 'package:flutter/material.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';
import 'package:suitmedia_mobile_dev_test/components/elevated_button.dart';
import 'package:suitmedia_mobile_dev_test/components/text_field.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  void _checkPalindrome(BuildContext context, String palindrome) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final isPalindrome = palindrome == palindrome.split('').reversed.join();

    if (palindrome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Palindrome cannot be empty'),
        ),
      );
      return;
    }
    if (isPalindrome) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Palindrome'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not palindrome'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = '';
    String palindrome = '';

    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          padding: CustomTheme.screenPadding,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/ic_photo.png'),
                const SizedBox(height: 55),
                MyTextField(
                  hintText: 'Name',
                  onChanged: (value) {
                    name = value;
                  },
                ),
                MyTextField(
                  hintText: 'Palindrome',
                  onChanged: (value) {
                    palindrome = value;
                  },
                ),
                const SizedBox(height: 25),
                MyElevatedButton(
                    titleText: 'CHECK',
                    onPressed: () {
                      _checkPalindrome(context, palindrome);
                    }),
                MyElevatedButton(
                  titleText: 'NEXT',
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
