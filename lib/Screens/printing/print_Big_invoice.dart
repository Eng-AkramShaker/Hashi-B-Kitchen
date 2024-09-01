// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, must_be_immutable, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, unnecessary_null_comparison, unused_field

import 'package:face_auth_flutter/Screens/printing/Small_print.dart';
import 'package:face_auth_flutter/Screens/printing/widgets/qr.dart';
import 'package:face_auth_flutter/Screens/printing/widgets/row_tex.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/divider/divider.dart';
import 'package:face_auth_flutter/widgets/images/custom_image.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Print_Big_Invoice extends StatefulWidget {
  var Invoice_Number;
  var Tax_number;
  var Date;
  var Cashier_name;
  var Discount_value;
  var Total_amount;
  var tax;
  var customOrderOptions;

  String selectedTable;
  List<Map<String, dynamic>> Invoice_items;

  // --------------------------------------------------
  var company_name;
  var branch;
  var company_address;
  var snap;
  var website;
  var tell;
  // ---------------------------------------------------

  String cash_Payment;
  String network_Payment;

  String qr;

  Print_Big_Invoice({
    super.key,
    required this.Invoice_Number,
    required this.Tax_number,
    required this.Date,
    required this.Cashier_name,
    required this.Discount_value,
    required this.Total_amount,
    required this.Invoice_items,
    required this.tax,
    required this.customOrderOptions,
    required this.selectedTable,

    //
    required this.company_name,
    required this.branch,
    required this.company_address,
    required this.snap,
    required this.website,
    required this.tell,
    required this.cash_Payment,
    required this.network_Payment,
    required this.qr,
  });

  @override
  State<Print_Big_Invoice> createState() => _Print_Big_InvoiceState();
}

class _Print_Big_InvoiceState extends State<Print_Big_Invoice> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    final pro_Invoice = Provider.of<Invoice_Provider>(context, listen: false);
    final prov_Printer = Provider.of<Printer_Provider>(context, listen: false);

    // ======== Big Print  ====================

    await Future.delayed(const Duration(seconds: 3), () async {
      await prov_Printer.Print_By_IP(_globalKey, prov_Printer.iP_Address_Print.text);
    });

    //  Small Print ==========================

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(child: Text('Small Printing', style: TextStyle(color: Theme.of(context).colorScheme.primary))),
          content: Small_Print(Invoice_items: widget.Invoice_items),
          actions: [
            TextButton(
              onPressed: () async {
                pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
      return Container(
        height: size.height,
        width: 300,
        color: Colors.white,
        child: SingleChildScrollView(
          child: RepaintBoundary(
            key: _globalKey,
            child: Column(
              //
              children: [
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Padding(padding: const EdgeInsets.all(8.0), child: Custom_Image('assets/images/logo.png')),
                ),
                Custom_Text(text: "${widget.branch}", size: 15),
                Row_Tex('${widget.Tax_number}', 'الرقم الضريبي'),
                Row_Tex('${widget.company_name}', 'أسم الشركة'),
                Row_Tex('${widget.company_address}', 'العنوان'),
                SizedBox(height: 10),
                Custom_Text(text: 'أهلا بكم في مطاعم حاشي باشا', size: 10),
                Custom_Text(text: "#  رقم المناداة لا تمثل دورك بالخدمة  #", size: 10),
                custom_divider(),
                Row_Tex('${widget.Invoice_Number ?? '1565566'}', 'رقم الطلب '),
                Row_Tex('${widget.customOrderOptions}', 'التوصيل'),
                Row_Tex(widget.selectedTable ?? "T14", 'رقم المناداة'),
                Row_Tex('${widget.Cashier_name}', 'إسم الكاشير'),
                Row_Tex('${widget.Date}', 'تاريخ الأصدار'),
                custom_divider(),
                Custom_Text(text: 'الأصناف', size: 12),
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
                custom_divider(),
                Row_Tex('${widget.Total_amount}', 'المبلغ شامل قيمة الضريبة المضافة'),
                Row_Tex('${widget.Discount_value}', 'قيمة الخصم'),
                Row_Tex('${widget.tax}', '%قيمة الضريبة 15'),
                custom_divider(),
                Row_Tex('${widget.Total_amount}', 'إجمالي المبلغ المستحق'),
                custom_divider(),
                Custom_Text(text: 'اجمالي المبلغ المدفوع', size: 12),
                Row_Tex('${widget.cash_Payment}', 'الدفع النقدي'),
                Row_Tex('${widget.network_Payment}', 'الدفع الشبكي'),
                custom_divider(),
                Row_Tex('${widget.Total_amount}', 'اجمالي المبلغ المدفوع'),
                custom_divider(),
                Custom_Text(text: 'السعر يشمل ضريبة القيمة المضافة %15', size: 10),
                Custom_Text(text: "Snap | insta | Twitter ${widget.snap}", size: 10),
                Custom_Text(text: "${widget.website} |  زرونا", size: 10),
                Custom_Text(text: "Tell : ${widget.tell}", size: 10),
                Custom_Text(text: 'ضريبة مبسطة', size: 10),
                Widget_Qr(
                  sellerName: '${widget.company_name}',
                  vatNumber: '${widget.Tax_number}',
                  invoiceDate: '${widget.Date}',
                  invoiceTotal: '${widget.Total_amount}',
                  vatAmount: '${widget.tax}',
                ),

                //
                Text('    \n        \n     \n    \n  '),

                Custom_Text(text: '   ', size: 10),
                Custom_Text(text: '   ', size: 10),
                Text('    \n        \n  \n '),
              ],
            ),
          ),
        ),
      );
    });
  }
}
