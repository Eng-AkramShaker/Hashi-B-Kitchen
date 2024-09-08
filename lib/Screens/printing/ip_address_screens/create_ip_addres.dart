// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables

import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Create_ip_address extends StatefulWidget {
  const Create_ip_address({super.key});

  @override
  State<Create_ip_address> createState() => _Create_ip_addressState();
}

class _Create_ip_addressState extends State<Create_ip_address> {
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

    return Consumer2<Invoice_Provider, Printer_Provider>(builder: (context, proInvoice, provPrinter, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            //

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Custom_Text(text: 'Enter Name IP', size: 16),
                    const SizedBox(height: 10),
                    Custom_Text_Field(
                      width: 300,
                      height: 40,
                      hint_text: 'print name ...',
                      Text_size: 12.sp,
                      TEXT_controller: provPrinter.Name_IPAddress,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 30),
                    Custom_Text(text: 'Enter IP Address', size: 16),
                    const SizedBox(height: 10),
                    Custom_Text_Field(
                      width: 300,
                      height: 40,
                      hint_text: '192.168.0.00',
                      Text_size: 12.sp,
                      TEXT_controller: provPrinter.IPAddress,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
