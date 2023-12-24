import 'package:flutter/material.dart';
import 'package:suitmedia_mobile_dev_test/components/app_bar.dart';

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Second Screen'),
      body: Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text(name),
      ),
    );
  }
}
