// ignore_for_file: avoid_print, camel_case_types, must_be_immutable, unused_local_variable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:face_auth_flutter/data/models/order_options_model.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';

class Choose_Order_Options extends StatefulWidget {
  const Choose_Order_Options({super.key, required this.items});
  final List<Order> items;

  @override
  State<Choose_Order_Options> createState() => _CustomDropState();
}

class _CustomDropState extends State<Choose_Order_Options> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(
      builder: (context, proInvoice, child) {
        selectedValue = proInvoice.name_Type_Payment;
        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proInvoice.name_Order_Options,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: wtColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              items: widget.items.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.name,
                  child: Center(
                    child: Text(
                      item.name ?? 'No Name',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(216, 255, 255, 255),
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              value: widget.items.any((item) => item.name == selectedValue) ? selectedValue : null,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  proInvoice.name_Order_Options = value!;
                });

                // Debug print to trace new selected value
                print('New selected value: $selectedValue');
              },
              buttonStyleData: ButtonStyleData(
                height: 6.h,
                width: 20.w,
                padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  border: Border.all(color: const Color.fromARGB(216, 255, 255, 255)),
                  color: brown_Color,
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 14.sp,
                iconEnabledColor: const Color.fromARGB(216, 255, 255, 255),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 50.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  color: brown_Color,
                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 50,
                padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
              ),
            ),
          ),
        );
      },
    );
  }
}
