import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';
import '../../data/models/serial/serial_number_model.dart';
import '../../data/provider/invoice_provider/invoice.dart';

class Return_Invoice extends StatefulWidget {
  const Return_Invoice({super.key, required this.items});
  final List<Datum> items;

  @override
  State<Return_Invoice> createState() => _ReturnInvoiceState();
}

class _ReturnInvoiceState extends State<Return_Invoice> {
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
            child: DropdownButton<String>(
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
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(216, 255, 255, 255),
              ),
              dropdownColor: brown_Color,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 14.sp,
                color: const Color.fromARGB(216, 255, 255, 255),
              ),
              itemHeight: 48.0,
              elevation: 2,
              borderRadius: BorderRadius.circular(.5.w),
            ),
          ),
        );
      },
    );
  }
}
