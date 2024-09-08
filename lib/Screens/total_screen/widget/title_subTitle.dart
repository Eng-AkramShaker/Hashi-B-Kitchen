// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class Title_SubTitle extends StatelessWidget {
  String title = '';
  String text = '';
  final bool showButton;

  Title_SubTitle({super.key, required this.title, required this.text, this.showButton = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              if (showButton) Icon(Icons.edit_square, size: 15, color: primaryColor),
            ],
          ),
        ),
      ],
    );
  }
}
