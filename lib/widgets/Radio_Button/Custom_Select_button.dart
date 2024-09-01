// ignore_for_file: must_be_immutable, camel_case_types, avoid_print

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import '../../core/constants/constants.dart';

class Custom_Select_Button extends StatefulWidget {
  Custom_Select_Button({super.key, required this.items});

  List<String> items;

  @override
  State<Custom_Select_Button> createState() => _Custom_Select_ButtonState();
}

class _Custom_Select_ButtonState extends State<Custom_Select_Button> {
  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() async {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);

    provCategory.Type_controlle.text = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Categories_Provider>(builder: (context, provCategory, child) {
      return CustomRadioButton(
        elevation: 0,
        absoluteZeroSpacing: false,
        unSelectedColor: Theme.of(context).canvasColor,
        buttonLables: widget.items,
        buttonValues: widget.items,
        defaultSelected: widget.items[0],
        buttonTextStyle: ButtonTextStyle(
          selectedColor: wtColor,
          unSelectedColor: Theme.of(context).colorScheme.onSecondary,
          textStyle: const TextStyle(fontSize: 16),
        ),
        radioButtonValue: (value) {
          print(value);

          setState(() {
            provCategory.Type_controlle.text = value;
          });
        },
        horizontal: false,
        width: 180,
        height: 50,
        selectedColor: brown_Color,
        padding: 10,
        enableShape: true,
        customShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        autoWidth: false,
        spacing: 10.0, // Add spacing between buttons
      );
    });
  }
}
