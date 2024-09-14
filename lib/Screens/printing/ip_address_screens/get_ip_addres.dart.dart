// ignore_for_file: camel_case_types, unused_local_variable, non_constant_identifier_names, avoid_print

import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';

class Get_ip_address extends StatefulWidget {
  const Get_ip_address({super.key});

  @override
  State<Get_ip_address> createState() => _Get_ip_addressState();
}

class _Get_ip_addressState extends State<Get_ip_address> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Consumer2<Invoice_Provider, Printer_Provider>(builder: (context, proInvoice, provPrinter, child) {
        return Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: size.height,
              width: size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provPrinter.Show_IP_Address!.message.length,
                itemBuilder: (BuildContext context, int index) {
                  final ip_adders = provPrinter.Show_IP_Address!.message[index];

                  return Card(
                    child: InkWell(
                      onTap: () {
                        //
                        setState(() {
                          provPrinter.iP_Address_Print.text = ip_adders.printIp.toString();
                        });
                        print(provPrinter.iP_Address_Print.text);
                        pop(context);
                      },
                      child: ListTile(
                        title: Center(
                          child: Text(
                            '${ip_adders.printName}',
                            style: TextStyle(color: Colors.green, fontSize: 13.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Center(
                          child: Text(
                            '${ip_adders.printIp}',
                            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
