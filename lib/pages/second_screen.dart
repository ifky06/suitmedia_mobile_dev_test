import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia_mobile_dev_test/Theme/custom_theme.dart';
import 'package:suitmedia_mobile_dev_test/bloc/user/user_bloc.dart';
import 'package:suitmedia_mobile_dev_test/components/app_bar.dart';
import 'package:suitmedia_mobile_dev_test/components/elevated_button.dart';
import 'package:suitmedia_mobile_dev_test/pages/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  const SecondScreen({super.key, required this.name});

  void _handleChooseUserButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ThirdScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Second Screen'),
      body: Padding(
        padding: CustomTheme.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                String? fullName;
                if (state is UserLoaded) {
                  fullName = '${state.user.firstName} ${state.user.lastName}';
                }
                return Text(
                  fullName ?? 'No User Selected',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
            MyElevatedButton(
              titleText: 'Chose a User',
              onPressed: (() {
                _handleChooseUserButton(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
