// ignore_for_file: camel_case_types

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FirstPage_Customer extends StatefulWidget {
  const FirstPage_Customer({super.key});

  @override
  State<FirstPage_Customer> createState() => _FirstPage_CustomerState();
}

class _FirstPage_CustomerState extends State<FirstPage_Customer> {
  List<String> items = ['Company', 'Individual'];

  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() async {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);

    provCategory.Type_controlle.text = 'Company';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer4<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider>(
        builder: (context, provCategory, proInvoice, provLogin, provShift, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            //
            const SizedBox(height: 30),
            CustomRadioButton(
              elevation: 0,
              absoluteZeroSpacing: false,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: items,
              buttonValues: items,
              defaultSelected: items[0],
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
              spacing: 10.0,
            ),

            Custom_Text_Field(
              width: size.width,
              hint_text: 'Customer Name',
              Text_size: 12.sp,
              TEXT_controller: provCategory.Name_controlle,
              color: Colors.black,
            ),

            if (provCategory.Type_controlle.text == 'Company')
              Column(
                children: [
                  Custom_Text_Field(
                    width: size.width,
                    hint_text: 'Tax Number',
                    Text_size: 12.sp,
                    TEXT_controller: provCategory.Tax_Number_controlle,
                    color: Colors.black,
                  ),
                  Custom_Text_Field(
                    width: size.width,
                    hint_text: 'Commercial Register ',
                    Text_size: 12.sp,
                    TEXT_controller: provCategory.Commercial_Register_controlle,
                    color: Colors.black,
                  ),
                  Custom_Text_Field(
                    width: size.width,
                    hint_text: 'City',
                    Text_size: 12.sp,
                    TEXT_controller: provCategory.City_controlle,
                    color: Colors.black,
                  ),
                  Custom_Text_Field(
                    width: size.width,
                    hint_text: 'Detailed Address',
                    Text_size: 12.sp,
                    TEXT_controller: provCategory.Detailed_Address_controlle,
                    color: Colors.black,
                    minLines: 4,
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }
}
