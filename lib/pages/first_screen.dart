import 'package:flutter/material.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';
import 'package:suitmedia_mobile_dev_test/components/elevated_button.dart';
import 'package:suitmedia_mobile_dev_test/components/text_field.dart';
import 'package:suitmedia_mobile_dev_test/pages/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  void _checkPalindrome(BuildContext context, String palindrome) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final isPalindrome = palindrome.replaceAll(' ', '').toLowerCase() ==
        palindrome.split('').reversed.join().replaceAll(' ', '').toLowerCase();

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

  void _handleNextButton(BuildContext context, String name) {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Name cannot be empty'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(name: name),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  textController: nameController,
                ),
                MyTextField(
                  hintText: 'Palindrome',
                  textController: palindromeController,
                ),
                const SizedBox(height: 25),
                MyElevatedButton(
                    titleText: 'CHECK',
                    onPressed: () {
                      _checkPalindrome(context, palindromeController.text);
                    }),
                MyElevatedButton(
                    titleText: 'NEXT',
                    onPressed: () {
                      _handleNextButton(context, nameController.text);
                    }),
              ],
            ),
          )),
    );
  }
}
