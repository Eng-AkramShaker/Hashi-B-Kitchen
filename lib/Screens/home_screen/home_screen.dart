// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable, unused_element, camel_case_types, sized_box_for_whitespace, unused_local_variable, unnecessary_null_comparison

import 'package:face_auth_flutter/Screens/cost_sharing/cost_sharing.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/menu_Item.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/option_Item.dart';
import 'package:face_auth_flutter/Screens/orders/orders_screen.dart';
import 'package:face_auth_flutter/Screens/start_shift/start_shift.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/sales_Invoice_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/services/start_shift_api.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/provider/upload_All_invoices/upload_All_invoices.dart';
import 'package:face_auth_flutter/widgets/cards/empty.dart';
import 'package:face_auth_flutter/widgets/dropdown_button/payment.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'widgets/app_bar.dart';
import '../total_screen/total_screen.dart';
import 'widgets/category_button.dart';
import 'widgets/menu_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List List_Type_Payment_2 = [];

  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() async {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    final proInvoice = Provider.of<Invoice_Provider>(context, listen: false);
    final prov_Login = Provider.of<Login_Provider>(context, listen: false);
    final prov_shift = Provider.of<Shift_Provider>(context, listen: false);
    final prov_Orders = Provider.of<Orders_Provider>(context, listen: false);

    final user_Hive = Provider.of<Hive_User_Provider>(context, listen: false);
    final open_shift_Hive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);

    final upload_All_invoices_Hive = Provider.of<Hive_Upload_All_invoices>(context, listen: false);
    final pro_upload_Api = Provider.of<Upload_All_invoices_Provider>(context, listen: false);

    setState(() {
      provCategory.Name_controlle.text = 'Default Customer';
    });

    try {
      await provCategory.fetch_group_product(context);
      await provCategory.fetch_Details_Customers(context);
      proInvoice.Fetch_Order_Options_Method(context);
      await proInvoice.Fetch_Payment_Method(context);
      proInvoice.Fetch_Serial_Number(context);
      prov_shift.get_Best_Seller(context);
      prov_Orders.Fetch_Order_invoice(context);

      get_Search(provCategory);

      if (proInvoice.List_Type_Payment != null) {
        for (var i = 0; i < proInvoice.List_Type_Payment!.message.length; i++) {
          if (proInvoice.List_Type_Payment!.message[i].name != 'Cash') {
            List_Type_Payment_2.add(proInvoice.List_Type_Payment!.message[i]);
          }
        }
      }

      pro_upload_Api.Upload_All_Invoices_To_Api(context, hive_Upload_All: upload_All_invoices_Hive);

      if (open_shift_Hive.data == false) {
        await Snack_Select_Menu(
          context: context,
          widget: SizedBox(
            width: 30.w,
            child: Start_Shift(),
          ),
          onPressed: () async {
            await Fund_amount_Api()
                .Post_Api_Start_Shift(context, proInvoice.text_controlle_Starting_Fund_mount.text, prov_Login.user!.name.toString());
            setState(() {
              proInvoice.text_controlle_Starting_Fund_mount.text = '00.0';
            });
          },
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  _onOptionSelected(int index) {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    setState(() {
      provCategory.index_Delivery = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final pro_Printer = Provider.of<Printer_Provider>(context, listen: false);

    return Consumer6<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider, Cost_Sharing_Provider, Orders_Provider>(
      builder: (context, provCategory, proInvoice, provLogin, prov_sharing, proCostSharing, prov_Orders, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: Custom_App_Bar(context, prov_sharing),
            body: Column(
              children: [
                //

                build_Total_Invoice(provLogin, provCategory, proInvoice, prov_Orders, proCostSharing, pro_Printer),
                build_Categories(provCategory, pro_Printer, size),
              ],
            ),
          ),
        );
      },
    );
  }

  void get_Search(Categories_Provider provCategory) {
    provCategory.items_Search = [];
  }

  //

  Widget build_Row_Dellivery(Categories_Provider provCategory) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionItem(
          isSelected: provCategory.index_Delivery == 0,
          icon: Icons.store,
          text: 'Dine In',
          onPressed: () {
            setState(() {
              provCategory.index_Delivery = 0;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: OptionItem(
            isSelected: provCategory.index_Delivery == 1,
            icon: Icons.directions_walk,
            text: 'Pick Up',
            onPressed: () {
              setState(() {
                provCategory.index_Delivery = 1;
              });
            },
          ),
        ),
        OptionItem(
          isSelected: provCategory.index_Delivery == 2,
          icon: Icons.local_shipping,
          text: 'Delivery',
          onPressed: () {
            setState(() {
              provCategory.index_Delivery = 2;
            });
          },
        ),
      ],
    );
  }

  //

  Widget build_Categories(Categories_Provider provCategory, Printer_Provider pro_Printer, Size size) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container_Empty(
              h: size.height,
              w: size.width,
              color: Theme.of(context).colorScheme.onBackground,
              Padding: 2,
              border: true,
              child: const Total_Screen(),
            ),
          ),

          // =============================================================================================

          const SizedBox(width: 10),

          Expanded(
            flex: 2,
            child: Container_Empty(
              Padding: 2,
              border: true,
              color: Theme.of(context).colorScheme.onBackground,
              child: provCategory.isLoading == false
                  ? Center(
                      child: Container(
                          width: 25, height: 25, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary)))
                  : Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provCategory.Items_group_product!.message.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CategoryButton(
                                  title: provCategory.Items_group_product!.message[index].itemGroup.toString(),
                                  img: provCategory.Items_group_product!.message[index].groupImage.toString(),
                                  isSelected: provCategory.selectedCategory == index,
                                  onTap: () {
                                    setState(() {
                                      provCategory.selectedCategory = index;
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Menu_Products(
                          context: context,
                          provCategory: provCategory,
                          items: provCategory.Items_group_product!.message[provCategory.selectedCategory].items,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget build_Total_Invoice(Login_Provider provLogin, Categories_Provider provCategory, Invoice_Provider proInvoice,
      Orders_Provider prov_Orders, Cost_Sharing_Provider proCostSharing, Printer_Provider pro_Printer) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          build_Row_Dellivery(provCategory),

          // ---------------------------------------------------------------------------

          const SizedBox(width: 50),
          // MenuItem(icon: Icons.receipt, text: 'Orders', onPressed: () {}),
          MenuItem(
            icon: Icons.refresh,
            text: 'Refresh',
            onPressed: () {
              Reset_Invoice(provCategory, proInvoice, proCostSharing);
            },
          ),

          // Orders ---------------------------------------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: MenuItem(
                icon: Icons.receipt,
                text: 'Orders',
                onPressed: () async {
                  await prov_Orders.Fetch_Order_invoice(context);

                  Snack_Select_Menu(
                    context: context,
                    widget: SizedBox(
                      height: 600,
                      width: 500,
                      child: Column(
                        children: [
                          prov_Orders.is_Loading == true
                              ? Center(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                                  ),
                                )
                              : const OrdersScreen(),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      pop(context);
                    },
                  );
                }),
          ),

          // Note ----------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MenuItem(
                icon: Icons.note,
                text: 'Note',
                onPressed: () {
                  Snack_Select_Menu(
                      context: context,
                      backgColor: Theme.of(context).colorScheme.primaryContainer,
                      widget: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Custom_Text_Field(
                          width: 400,
                          height: 200,
                          hint_text: 'Note ...... ',
                          Text_size: 12.sp,
                          TEXT_controller: provCategory.text_Note,
                          color: Colors.black,
                          minLines: 18,
                        ),
                      ),
                      onPressed: () async {
                        //
                        setState(() {
                          //
                        });

                        pop(context);
                      });
                }),
          ),

          // Split ---------------------------------------------------------------------------

          MenuItem(
              icon: Icons.content_cut,
              text: 'Split',
              onPressed: () {
                //

                pushNewScreen(context, const Cost_Sharing());
              }),

          // Print - IP ----------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MenuItem(
                icon: Icons.print,
                text: 'IP_Print',
                onPressed: () {
                  Snack_Select_Menu(
                      context: context,
                      backgColor: Theme.of(context).colorScheme.primaryContainer,
                      widget: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 200,
                          child: Column(
                            children: [
                              Custom_Text(text: 'Enter IP Address', size: 20),
                              const SizedBox(height: 50),
                              Custom_Text_Field(
                                width: 300,
                                height: 40,
                                hint_text: '192.168.2.100',
                                Text_size: 12.sp,
                                TEXT_controller: pro_Printer.iP_Address_Print,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onPressed: () async {
                        //
                        setState(() {
                          //
                        });

                        pop(context);
                      });
                }),
          ),

          // Submit --------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MenuItem(
                icon: Icons.save,
                text: 'Submit',
                onPressed: () async {
                  setState(() {
                    proInvoice.cash_Payment.text = '0';
                    proInvoice.network_Payment.text = '0';
                    proInvoice.Total = 0;
                  });

                  for (var i = 0; i < proInvoice.change_List_Invoice.length; i++) {
                    setState(() {
                      proInvoice.Total = proInvoice.Total + double.parse(proInvoice.change_List_Invoice[i].change_price);
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
                                  const SizedBox(height: 20),
                                  Custom_Text(text: "${proInvoice.Total} ", size: 15.sp, fontweight: FontWeight.bold),
                                  Custom_Text(text: ": الأجمالي", size: 13.sp, fontweight: FontWeight.bold),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Choose_Payment(items: proInvoice.List_Type_Payment!.message),
                                  Custom_Text(text: ':  الخيارات', size: 13.sp, fontweight: FontWeight.bold, color: Colors.black),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Custom_Text_Field(
                                        width: 280,
                                        hint_text: '0',
                                        Text_size: 12.sp,
                                        TEXT_controller: proInvoice.cash_Payment,
                                        color: Colors.black),
                                    Custom_Text(text: ':  الدفع النقدي', size: 13.sp, fontweight: FontWeight.bold),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),

                              // =================================================================
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Choose_Payment_Meda(items: List_Type_Payment_2),
                                  Custom_Text(text: ':  الخيارات', size: 13.sp, fontweight: FontWeight.bold, color: Colors.black),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Custom_Text_Field(
                                        width: 280,
                                        hint_text: '0',
                                        Text_size: 12.sp,
                                        TEXT_controller: proInvoice.network_Payment,
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
                      List<Model_Change_SalesInvoice> list_all_Items = [];

                      double Pay_cash = double.parse(proInvoice.cash_Payment.text ?? '0.0');
                      double Pay_network = double.parse(proInvoice.network_Payment.text ?? '0.0');
                      double Total_Cash_Or_Network = Pay_cash + Pay_network;

                      setState(() {});

                      //

                      if (proInvoice.Total == Total_Cash_Or_Network) {
                        if (proInvoice.main_List_Invoice.isEmpty) {
                          await pop(context);
                          Snak_Bar(context, ' لم تقم بأختيار منتج ');
                        } else if (pro_Printer.iP_Address_Print.text == '') {
                          await pop(context);
                          Snak_Bar(context, 'IP Address  لم تقم باَضافة ');
                        } else {
                          if (provCategory.index_Delivery == 0) {
                            setState(() {
                              proInvoice.name_Order_Options = 'محلي';
                            });
                          } else if (provCategory.index_Delivery == 1) {
                            setState(() {
                              proInvoice.name_Order_Options = 'سفري';
                            });
                          } else if (provCategory.index_Delivery == 2) {
                            setState(() {
                              proInvoice.name_Order_Options = 'توصيل';
                            });
                          }

                          //
                          await pop(context);

                          await proInvoice.Send_Total_Sales_Invoice(
                            context: context,
                            provCategory: provCategory,
                            provLogin: provLogin,
                            prov_Orders: prov_Orders,
                            prov_Printer: pro_Printer,

                            items: proInvoice.change_List_Invoice,
                            payment_method: proInvoice.name_Type_Payment,
                            order_options_method: proInvoice.name_Order_Options,
                            tax: proInvoice.Tax.toString(),
                            total: proInvoice.Cal_total.toString(),

                            selectedTable: proInvoice.selectedTable,

                            //
                            cash_Payment: Pay_cash.toString(),
                            network_Payment: Pay_network.toString(),
                          );

                          // print model Stat Tp100 =====

                          Reset_Invoice(provCategory, proInvoice, proCostSharing);
                        }

                        // --------------------------------------------

                        setState(() {
                          proInvoice.cash_Payment.text = '';
                          proInvoice.network_Payment.text = '';
                          proInvoice.Total = 0.0;
                        });
                      } else {
                        pop(context);
                        Snak_Bar(context, "المبلغ غير صحيح");
                      }
                    },
                  );
                }),
          ),
          //
          // if (pro_Printer.capturedImageBytes != null)
          //   Container(
          //     width: 230,
          //     height: double.infinity,
          //     child: SingleChildScrollView(
          //       child: Image.memory(
          //         pro_Printer.capturedImageBytes!,
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),

          // ElevatedButton(
          //   onPressed: () async {
          //     //

          //     print(pro_Printer.capturedImageBytes);
          //   },
          //   child: const Text('data'),
          // ),
        ],
      ),
    );
  }

  //

  Reset_Invoice(Categories_Provider provCategory, Invoice_Provider pro_Invoice, Cost_Sharing_Provider proCostSharing) async {
    setState(() {
      pro_Invoice.Remaining_price = 0.0;
      pro_Invoice.pay = 0;

      pro_Invoice.main_List_Invoice = [];
      pro_Invoice.change_List_Invoice = [];

      provCategory.index_Delivery = 0;
      pro_Invoice.Cal_total = 0.0;
      pro_Invoice.Sub_total = 0;
      provCategory.text_Note.text = 'Note ....';

      proCostSharing.List_page_2 = [];
      proCostSharing.List_page_3 = [];
      proCostSharing.List_Print = [];
    });
    await provCategory.fetch_Details_Customers(context);
  }
}
