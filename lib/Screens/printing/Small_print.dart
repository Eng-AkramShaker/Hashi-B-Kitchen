// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, must_be_immutable, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, unnecessary_null_comparison, unused_field

import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Small_Print extends StatefulWidget {
  List<Map<String, dynamic>> Invoice_items;

  Small_Print({super.key, required this.Invoice_items});

  @override
  State<Small_Print> createState() => _Small_PrintState();
}

class _Small_PrintState extends State<Small_Print> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    final pro_Invoice = Provider.of<Invoice_Provider>(context, listen: false);
    final prov_Printer = Provider.of<Printer_Provider>(context, listen: false);

    // ======== Form_Print  ====================

    _globalKey;
    Future.delayed(const Duration(seconds: 2), () async {
      print('===================== Small_Print ========================');

      await prov_Printer.Print_Model_Star(_globalKey, prov_Printer.iP_Address_Print.text);

      await prov_Printer.print_Model_EPSON(_globalKey, prov_Printer.iP_Address_Print.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
      return SingleChildScrollView(
        child: Container(
          // height: size.height,
          width: 300,
          color: Colors.white,
          child: RepaintBoundary(
            key: _globalKey,
            child: Column(
              children: [
                //

                widget.Invoice_items.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: widget.Invoice_items.length,
                        itemBuilder: (context, index) {
                          String qty = widget.Invoice_items[index]['qty'].toString();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(width: 50, child: Custom_Text(text: '${widget.Invoice_items[index]['price']}', size: 10)),
                              Container(width: 50, alignment: Alignment.centerRight, child: Custom_Text(text: '$qty', size: 10)),
                              Container(
                                width: 130,
                                alignment: Alignment.centerRight,
                                child: Custom_Text(text: '${widget.Invoice_items[index]['item_code']}', size: 10),
                              ),
                            ],
                          );
                        },
                      )
                    : SizedBox.shrink(),

                //

                Text('    \n        \n     \n    '),
              ],
            ),
          ),
        ),
      );
    });
  }
}
