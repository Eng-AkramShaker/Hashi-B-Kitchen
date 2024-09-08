// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Start_Shift extends StatelessWidget {
  Start_Shift({Key? key}) : super(key: key);

  final List<String> Invoices_rechargeAmounts = [
    '1 ريال',
    '5 ريال',
    '10 ريال',
    '50 ريال',
    '100 ريال',
    '500 ريال',
  ];

  final List<String> Invoices_quantity = [
    'كمية',
    'كمية',
    'كمية',
    'كمية',
    'كمية',
    'كمية',
  ];

  final List<String> Coins_rechargeAmounts = [
    '1 ريال',
    '5 ريال',
    '10 ريال',
    '50 ريال',
    '100 ريال',
    '500 ريال',
  ];

  final List<String> Coins_quantity = [
    'كمية',
    'كمية',
    'كمية',
    'كمية',
    'كمية',
    'كمية',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, proInvoice, child) {
      return ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Custom_Text(
                    text: 'مبلغ البدء',
                    size: 14.sp,
                    fontweight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 10),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Custom_Text(
                            text: "المبلغ بالمجموع",
                            size: 12.sp,
                            fontweight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          SizedBox(
                            width: 110,
                            height: 50,
                            child: Custom_Text_Field(
                              hint_text: "00.0",
                              TEXT_controller: proInvoice.text_controlle_Starting_Fund_mount,
                              color: redColor,
                              Text_size: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Custom_Text(text: 'فواتير', size: 13.sp, fontweight: FontWeight.bold, color: Colors.black),

                      Card(
                        child: ListView.builder(
                          itemCount: Invoices_rechargeAmounts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Custom_Text(
                                        text: Invoices_rechargeAmounts[index],
                                        size: 12.sp,
                                        fontweight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSecondary,
                                      ),
                                      Custom_Text(
                                        text: Invoices_quantity[index],
                                        size: 12.sp,
                                        fontweight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSecondary,
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 1, color: gryColor),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 5),

                      // =========================================================================

                      Custom_Text(text: 'عملات معدنية', size: 13.sp, fontweight: FontWeight.bold, color: Colors.black),

                      // =========================================================================

                      const SizedBox(height: 5),

                      Card(
                        child: ListView.builder(
                          itemCount: Coins_rechargeAmounts.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Custom_Text(
                                        text: Coins_rechargeAmounts[index],
                                        size: 12.sp,
                                        fontweight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSecondary,
                                      ),
                                      Custom_Text(
                                        text: Coins_quantity[index],
                                        size: 12.sp,
                                        fontweight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.onSecondary,
                                      ),
                                    ],
                                  ),
                                  const Divider(height: 1, color: gryColor),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          });
    });
  }
}
