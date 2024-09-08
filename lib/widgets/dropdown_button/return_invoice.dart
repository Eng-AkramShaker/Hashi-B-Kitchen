// ignore_for_file: avoid_print

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:face_auth_flutter/data/models/serial_number_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import '../../core/constants/constants.dart';

class Return_Invoice extends StatefulWidget {
  const Return_Invoice({super.key, required this.items});
  final List<Datum> items;

  @override
  State<Return_Invoice> createState() => _Return_InvoiceState();
}

class _Return_InvoiceState extends State<Return_Invoice> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(
      builder: (context, proInvoice, child) {
        // Ensure the selected value is one of the items in the list or null
        final List<String> itemNames = widget.items.map((item) => item.name ?? '').toList();
        if (!itemNames.contains(selectedValue)) {
          selectedValue = null;
        }

        return Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      proInvoice.name_Serial_Number ?? 'Serial Number',
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
              items: widget.items.map<DropdownMenuItem<String>>((Datum item) {
                return DropdownMenuItem<String>(
                  value: item.name,
                  child: Center(
                    child: Text(
                      item.name ?? '',
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
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  proInvoice.name_Serial_Number = value!;
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
