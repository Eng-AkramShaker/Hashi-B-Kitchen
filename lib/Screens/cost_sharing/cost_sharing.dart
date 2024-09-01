// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, unnecessary_null_comparison, must_be_immutable, unnecessary_brace_in_string_interps

import 'package:face_auth_flutter/core/constants/check_interner.dart';
import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/sales_Invoice_model.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/Buttons/custom_button.dart';
import 'package:face_auth_flutter/widgets/rows/row_choose_category.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widgets/dropdown_button/payment.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import '../../widgets/show_snack/select_menu.dart';
import '../../widgets/texts/custom_text.dart';

class Cost_Sharing extends StatefulWidget {
  const Cost_Sharing({super.key});

  @override
  State<Cost_Sharing> createState() => _CostSharingState();
}

class _CostSharingState extends State<Cost_Sharing> {
  int _selectedIndex = 0;

  List List_Type_Payment_2 = [];

  _onOptionSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    intS();
  }

  intS() {
    final proInvoice = Provider.of<Invoice_Provider>(context, listen: false);

    if (proInvoice.List_Type_Payment != null) {
      for (var i = 0; i < proInvoice.List_Type_Payment!.message.length; i++) {
        if (proInvoice.List_Type_Payment!.message[i].name != 'Cash') {
          List_Type_Payment_2.add(proInvoice.List_Type_Payment!.message[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer6<Categories_Provider, Invoice_Provider, Login_Provider, Cost_Sharing_Provider, Orders_Provider, Printer_Provider>(
        builder: (context, provCategory, pro_Invoice, prov_Login, proCostSharing, prov_Orders, prov_Printer, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: check_internet(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: size.height,
            width: size.width,
            color: Theme.of(context).colorScheme.background,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // page 1  ------------------------------------------------------------------------------------

                Flexible(
                  flex: 1,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 4, color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: pro_Invoice.change_List_Invoice.length,
                        itemBuilder: (context, index) {
                          final category = pro_Invoice.change_List_Invoice[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });

                              //

                              proCostSharing.List_page_2.add(pro_Invoice.change_List_Invoice[index]);

                              pro_Invoice.change_List_Invoice.removeAt(index);
                            },
                            child: Row_Choose_Category(
                              context: context,
                              isSelected: _selectedIndex == index,
                              name: category.change_itemCode,
                              price: category.change_price,
                              count: category.change_qty.toString(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // page 2  ------------------------------------------------------------------------------------

                Container(
                  height: size.height,
                  width: size.width / 2.9,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 4, color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: size.height,
                          width: size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: proCostSharing.List_page_2.length,
                                  itemBuilder: (context, index) {
                                    final category = proCostSharing.List_page_2[index];

                                    return Row_Choose_Category(
                                      context: context,
                                      name: category.change_itemCode,
                                      price: category.change_price,
                                      count: category.change_qty.toString(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //

                      Flexible(
                        flex: 0,
                        child: Container(
                          height: 70,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 35, 56),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Custom_Button(
                                  context: context,
                                  title: "Pay",
                                  size_text: 15,
                                  horizontal: 50,
                                  Color_text: bgColor,
                                  onPressed: () async {
                                    setState(() {
                                      proCostSharing.cash_Payment.text = '0';
                                      proCostSharing.network_Payment.text = '0';
                                      proCostSharing.Total = 0;
                                    });

                                    for (var i = 0; i < proCostSharing.List_page_2.length; i++) {
                                      setState(() {
                                        proCostSharing.Total =
                                            proCostSharing.Total + double.parse(proCostSharing.List_page_2[i].change_price);
                                      });
                                    }

                                    Snack_Select_Menu(
                                      context: context,
                                      backgColor: Theme.of(context).colorScheme.primaryContainer,
                                      widget: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Container(
                                          height: 500,
                                          width: 410,
                                          child: Consumer<Categories_Provider>(builder: (context, prov_Category, child) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(height: 20),
                                                    Custom_Text(
                                                        text: "${proCostSharing.Total} ", size: 15.sp, fontweight: FontWeight.bold),
                                                    Custom_Text(text: ": الأجمالي", size: 13.sp, fontweight: FontWeight.bold),
                                                  ],
                                                ),
                                                SizedBox(height: 50),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Choose_Payment(items: pro_Invoice.List_Type_Payment!.message),
                                                    Custom_Text(
                                                        text: ':  الخيارات',
                                                        size: 13.sp,
                                                        fontweight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Custom_Text_Field(
                                                          width: 280,
                                                          hint_text: '0',
                                                          Text_size: 12.sp,
                                                          TEXT_controller: proCostSharing.cash_Payment,
                                                          color: Colors.black),
                                                      Custom_Text(text: ':  الدفع النقدي', size: 13.sp, fontweight: FontWeight.bold),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 50),

                                                // =================================================================
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Choose_Payment_Meda(items: List_Type_Payment_2),
                                                    Custom_Text(
                                                        text: ':  الخيارات',
                                                        size: 13.sp,
                                                        fontweight: FontWeight.bold,
                                                        color: Colors.black),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Container(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Custom_Text_Field(
                                                          width: 280,
                                                          hint_text: '0',
                                                          Text_size: 12.sp,
                                                          TEXT_controller: proCostSharing.network_Payment,
                                                          color: Colors.black),
                                                      Custom_Text(text: ':  الدفع الشبكي', size: 13.sp, fontweight: FontWeight.bold),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          }),
                                        ),
                                      ),
                                      onPressed: () async {
                                        //
                                        List<Model_Change_SalesInvoice> list_all_Page_2 = [];

                                        double Pay_cash = double.parse(proCostSharing.cash_Payment.text);
                                        double Pay_network = double.parse(proCostSharing.network_Payment.text);

                                        double Total_Cash_Or_Network = Pay_cash + Pay_network;

                                        setState(() {});

                                        //

                                        if (proCostSharing.Total == Total_Cash_Or_Network) {
                                          setState(() {
                                            for (var i = 0; i < proCostSharing.List_page_2.length; i++) {
                                              final val = proCostSharing.List_page_2[i];
                                              list_all_Page_2.add(
                                                Model_Change_SalesInvoice(
                                                  change_itemCode: val.change_itemCode,
                                                  change_qty: val.change_qty,
                                                  change_costCenter: val.change_costCenter,
                                                  change_price: val.change_price,
                                                  cash_Payment: '',
                                                  network_Payment: '',
                                                ),
                                              );

                                              // ==========

                                              proCostSharing.List_Print.add(
                                                Model_Change_SalesInvoice(
                                                  change_itemCode: val.change_itemCode,
                                                  change_qty: val.change_qty,
                                                  change_costCenter: val.change_costCenter,
                                                  change_price: val.change_price,
                                                  cash_Payment: '',
                                                  network_Payment: '',
                                                ),
                                              );
                                            }
                                            //----------------------------------

                                            // list_all_Page_2

                                            proCostSharing.List_page_3.add(
                                              Add_Page_2_Model(
                                                List_item: list_all_Page_2,
                                                cash_Payment: proCostSharing.cash_Payment.text,
                                                network_Payment: proCostSharing.network_Payment.text,
                                              ),
                                            );

                                            // --------------------------------------------
                                            // show button print ----------------------

                                            if (pro_Invoice.change_List_Invoice.isEmpty) {
                                              setState(() {
                                                proCostSharing.show_button_print = true;
                                              });
                                            }

                                            proCostSharing.List_page_2 = [];
                                            proCostSharing.cash_Payment.text = '';
                                            proCostSharing.network_Payment.text = '';
                                            proCostSharing.Total = 0.0;
                                          });
                                        } else {
                                          Snak_Bar(context, "المبلغ غير صحيح");
                                        }

                                        pop(context);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // // page 3  ------------------------------------------------------------------------------------

                Flexible(
                  flex: 1,
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 4, color: Colors.white),
                    ),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Container(
                              height: size.height,
                              width: size.width,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: proCostSharing.List_Print.length,
                                itemBuilder: (context, index) {
                                  final category = proCostSharing.List_Print[index];

                                  return InkWell(
                                    onTap: () {
                                      //
                                    },
                                    child: Row_Choose_Category(
                                      context: context,
                                      name: category.change_itemCode,
                                      price: category.change_price,
                                      count: category.change_qty.toString(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: Container(
                            height: 70,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 13, 35, 56),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  proCostSharing.show_button_print == true
                                      ? Custom_Button(
                                          context: context,
                                          title: "Print",
                                          icon: Icons.print,
                                          size_icon: 30,
                                          Color_icon: Colors.green,
                                          horizontal: 50,
                                          vertical: 12,
                                          Color_text: bgColor,
                                          onPressed: () async {
                                            //

                                            double total = 0;
                                            double cash = 0;
                                            double network = 0;

                                            if (proCostSharing.List_page_3.isNotEmpty) {
                                              setState(() {
                                                for (var i = 0; i < proCostSharing.List_page_3.length; i++) {
                                                  if (double.parse(proCostSharing.List_page_3[i].cash_Payment) > 0) {
                                                    cash += double.parse(proCostSharing.List_page_3[i].cash_Payment);
                                                    //
                                                  }
                                                  if (double.parse(proCostSharing.List_page_3[i].network_Payment) > 0) {
                                                    network += double.parse(proCostSharing.List_page_3[i].network_Payment);
                                                  }
                                                }

                                                //

                                                total = cash + network;
                                              });
                                              print(cash);
                                              print('=================================');
                                              print(network);

                                              await proCostSharing.cal_Total_List_Print();

                                              await pro_Invoice.Send_Total_Sales_Invoice(
                                                context: context,
                                                provCategory: provCategory,
                                                provLogin: prov_Login,
                                                prov_Orders: prov_Orders,
                                                prov_Printer: prov_Printer,

                                                items: proCostSharing.List_Print,
                                                payment_method: 'Cash',
                                                order_options_method: pro_Invoice.name_Order_Options,
                                                tax: proCostSharing.Tax.toString(),
                                                total: total.toString(),
                                                selectedTable: pro_Invoice.selectedTable,
                                                //
                                                cash_Payment: cash.toString(),
                                                network_Payment: network.toString(),
                                              );

                                              setState(() {
                                                // show button print ----------------------
                                                proCostSharing.show_button_print = false;

                                                proCostSharing.List_page_3 = [];
                                                proCostSharing.List_Print = [];
                                              });
                                            }
                                          })
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(7)),
                                              border: Border.all(color: Colors.black, width: 2.8)),
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                                              child: Icon(Icons.print, color: Colors.grey, size: 30)),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

//
