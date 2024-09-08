// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:face_auth_flutter/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/constants.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';

class MyDropdown extends StatefulWidget {
  final onChanged;
  const MyDropdown({super.key, this.onChanged});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  final List<dynamic> items = [
    {'name': 'All Printing'},
    {'name': 'Single Printing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer2<Invoice_Provider, Cost_Sharing_Provider>(
      builder: (context, proInvoice, proCostSharing, child) {
        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proCostSharing.namePrinting!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: bgColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              items: items.map<DropdownMenuItem<String>>((dynamic item) {
                return DropdownMenuItem<String>(
                  value: item['name'].toString(),
                  child: Center(
                    child: Text(
                      item['name'].toString(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: bgColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              value: proCostSharing.namePrinting,
              onChanged: widget.onChanged,

              //
              buttonStyleData: ButtonStyleData(
                height: 5.h,
                width: 13.w,
                padding: EdgeInsets.only(left: .5.w, right: .5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  border: Border.all(color: const Color.fromARGB(190, 255, 255, 255)),
                  color: wtColor,
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.print),
                iconSize: 15.sp,
                iconEnabledColor: Colors.green,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  color: brown_Color,
                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(30),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
