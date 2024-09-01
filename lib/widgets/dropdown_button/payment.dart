// ignore_for_file: avoid_print, camel_case_types, must_be_immutable, unused_local_variable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';

class Choose_Payment extends StatefulWidget {
  const Choose_Payment({super.key, required this.items});
  final List<dynamic> items;

  @override
  State<Choose_Payment> createState() => _CustomDropState();
}

class _CustomDropState extends State<Choose_Payment> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(
      builder: (context, proInvoice, child) {
        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proInvoice.name_Type_Payment,
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
              items: widget.items.map<DropdownMenuItem<String>>((dynamic item) {
                return DropdownMenuItem<String>(
                  value: item.name.toString(),
                  child: Center(
                    child: Text(
                      item.name.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: bgColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              value: proInvoice.name_Type_Payment,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  proInvoice.name_Type_Payment = value!;
                });

                print(selectedValue);
              },
              buttonStyleData: ButtonStyleData(
                height: 6.h,
                width: 20.w,
                padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  border: Border.all(color: const Color.fromARGB(216, 255, 255, 255)),
                  color: wtColor,
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 14.sp,
                iconEnabledColor: bgColor,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 50.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  color: wtColor,
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

// ---------------------------------------------------------------

class Choose_Payment_Meda extends StatefulWidget {
  const Choose_Payment_Meda({super.key, required this.items});
  final List<dynamic> items;

  @override
  State<Choose_Payment_Meda> createState() => _Choose_Payment_MedaState();
}

class _Choose_Payment_MedaState extends State<Choose_Payment_Meda> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(
      builder: (context, proInvoice, child) {
        selectedValue = proInvoice.Type_Payment_Meda;

        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proInvoice.Type_Payment_Meda,
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
              items: widget.items.map<DropdownMenuItem<String>>((dynamic item) {
                return DropdownMenuItem<String>(
                  value: item.name.toString(),
                  child: Center(
                    child: Text(
                      item.name.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: bgColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              value: proInvoice.Type_Payment_Meda,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  proInvoice.Type_Payment_Meda = value!;
                });

                print(selectedValue);
              },
              buttonStyleData: ButtonStyleData(
                height: 6.h,
                width: 20.w,
                padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  border: Border.all(color: const Color.fromARGB(216, 255, 255, 255)),
                  color: wtColor,
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 14.sp,
                iconEnabledColor: bgColor,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 50.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  color: wtColor,
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
