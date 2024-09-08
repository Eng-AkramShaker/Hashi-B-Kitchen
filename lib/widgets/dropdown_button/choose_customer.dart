// ignore_for_file: avoid_print, camel_case_types, must_be_immutable, unused_local_variable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';

class CustomDrop extends StatefulWidget {
  const CustomDrop({super.key, required this.items});
  final List<dynamic> items;

  @override
  State<CustomDrop> createState() => _CustomDropState();
}

class _CustomDropState extends State<CustomDrop> {
  String? selectedValue = 'Cash Customer';

  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(
      builder: (context, proInvoice, child) {
        selectedValue = proInvoice.nameCustomer;

        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proInvoice.nameCustomer!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        // fontWeight: FontWeight.bold,
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
                        fontSize: 11.sp,
                        // fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(216, 255, 255, 255),
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  proInvoice.nameCustomer = value!;
                });

                print(selectedValue);
              },
              buttonStyleData: ButtonStyleData(
                height: 5.h,
                width: 13.w,
                padding: EdgeInsets.only(left: .5.w, right: .5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(.5.w),
                  border: Border.all(color: const Color.fromARGB(190, 255, 255, 255)),
                  color: const Color.fromARGB(31, 218, 204, 75),
                ),
                elevation: 2,
              ),
              iconStyleData: IconStyleData(
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 14.sp,
                iconEnabledColor: const Color.fromARGB(216, 255, 255, 255),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 40.h,
                // width: 18.w,
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
                // padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
              ),
            ),
          ),
        );
      },
    );
  }
}
