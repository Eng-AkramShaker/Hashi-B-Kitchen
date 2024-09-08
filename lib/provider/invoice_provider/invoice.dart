// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, unused_local_variable

import 'package:face_auth_flutter/Screens/printing/print_Big_invoice.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/order_options_model.dart';
import 'package:face_auth_flutter/data/models/payment_model.dart';
import 'package:face_auth_flutter/data/models/print_sales_invoice.dart';
import 'package:face_auth_flutter/data/models/sales_Invoice_model.dart';
import 'package:face_auth_flutter/data/models/serial_number_model.dart';
import 'package:face_auth_flutter/data/models/user_model.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/provider/printer_provider/printer_provider.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../data/services/api.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import '../auth/Login.dart';
import '../categories_provider/categories.dart';

class Invoice_Provider with ChangeNotifier {
  //

  double Remaining_price = 0.0;
  double count = 0;
  double pay = 0;
  double discount = 0.0;
  int Number_of_invoices = 0;

  TextEditingController text_controlle = TextEditingController();

  var future_All_Product;

  // Sales_Invoice ----------------------------------

  DateTime now = DateTime.now();

  List<ModelSalesInvoice> main_List_Invoice = [];
  List<Model_Change_SalesInvoice> change_List_Invoice = [];

  double Cal_total = 0.0;
  double Sub_total = 0.0;
  double Tax = 0.0;

  //  Name_Customer ----------------------------------

  String Name_Customer = 'Default Customer';
  String? get nameCustomer => Name_Customer;
  set nameCustomer(String? value) {
    Name_Customer = value!;
    notifyListeners();
  }

  // Print --------------------------------------------

  // WidgetsToImageController controller_1 = WidgetsToImageController();
  // Uint8List? bytesController;

  // ======

  List<Model_Print> Data_Print = [];
  ModelPayment? List_Type_Payment;

  List List_Type_Payment_2 = [];

  String name_Type_Payment = 'Cash';
  String Type_Payment_Meda = 'Meda';
  List<Order>? List_Order_Options;
  String name_Order_Options = 'سفري';
  String selectedTable = 'T14';

  // print

  TextEditingController cash_Payment = TextEditingController();
  TextEditingController network_Payment = TextEditingController();
  double Total = 0;

  // Serial_Number --------------------------------------------

  List<Datum> List_Serial_Number = [];
  String? name_Serial_Number;
  // Treasury_Amount --------------------------------------------

  TextEditingController text_controlle_Starting_Fund_mount = TextEditingController();

  // add_One item To Sales Invoice =================================================

  add_One_item_To_Sales_Invoice({required String name, required int qty, required String price}) {
    ModelSalesInvoice newItem = ModelSalesInvoice(
      itemCode: name,
      qty: qty,
      costCenter: "Main - Hashi Basha",
      price: price,
    );

    main_List_Invoice.add(newItem);

    Model_Change_SalesInvoice Item = Model_Change_SalesInvoice(
      change_itemCode: name,
      change_qty: qty,
      change_costCenter: "Main - Hashi Basha",
      change_price: price,
      //
      cash_Payment: '',
      network_Payment: '',
    );

    change_List_Invoice.add(Item);

    notifyListeners();
  }

// remove item ==================================================================================

  remove_Item({required int index}) {
    change_List_Invoice.removeAt(index);

    cal_Total();
    notifyListeners();
  }

  // cal_Total ======================================================================================

  cal_Total() async {
    Cal_total = 0;
    Sub_total = 0;
    Tax = 0.0;

    for (var i = 0; i < change_List_Invoice.length; i++) {
      print(change_List_Invoice[i]);

      Cal_total += double.parse(change_List_Invoice[i].change_price.toString()); // 115

      Tax = (15 / 100) * Cal_total; // 8.5

      Sub_total = Cal_total - Tax; // 97.27
    }

    print(Tax);
    notifyListeners();
  }

  // Send Sales Invoice To Api =========================================

  Send_Total_Sales_Invoice({
    required context,
    required Categories_Provider provCategory,
    required Login_Provider provLogin,
    required Orders_Provider prov_Orders,
    required Printer_Provider prov_Printer,
    //
    required List<Model_Change_SalesInvoice> items,
    required String payment_method,
    required String order_options_method,
    required String tax,
    required String selectedTable,

    //
    required String total,
    required String cash_Payment,
    required String network_Payment,

    //
  }) async {
    final hive_Upload_All_Invoice = Provider.of<Hive_Upload_All_invoices>(context, listen: false);
    bool result = await InternetConnectionChecker().hasConnection;

    String Date_Now = await DateFormat('yyyy-MM-dd').format(now);
    Data_Print = [];
    My_User user = provLogin.user!;

    if (items.isEmpty) {
      Snak_Bar(context, 'قم بإضافة منتج');
    } else {
      List<Map<String, dynamic>> Send_items_Api = [];
      List<Map<String, dynamic>> Send_items_Print = [];

      for (var element in items) {
        Send_items_Api.add({
          "item_code": element.change_itemCode,
          "qty": element.change_qty,
          "cost_center": element.change_costCenter,
        });

        Send_items_Print.add({
          "item_code": element.change_itemCode,
          "qty": element.change_qty,
          "price": element.change_price,
        });
      }

      print(Send_items_Print);

      // Save All_Invoice in  Hive ============================================================

      if (result == true) {
        // On Line --------------
      } else {
        // Off Line --------------

        print('++++++++++++++++++++ no but Save Upload_All_Invoice');

        await hive_Upload_All_Invoice.add_Hive_Upload_All_invoices(
          context,
          branch: user.branch!,
          Date_Now: Date_Now,
          Name_Customer: Name_Customer,
          order_options: order_options_method,
          List_items: Send_items_Api,
        );
      }

      // Send_Sales_Invoice to Api ============================================================

      await Api()
          .Api_Send_Sales_Invoice(context, user.branch!, Date_Now, Name_Customer, Send_items_Api, "Cash", 10, order_options_method);

      await prov_Orders.Order_Number_calculator(context, prov_Orders.List_Order_invoice!.message.last.name.toString());

      Data_Print.add(Model_Print(
        company_name: user.companyName,
        Tax_number: user.taxId,
        Invoice_Number: prov_Orders.order_number,
        branch: user.branch,
        Date: Date_Now,
        company_address: user.companyAddress,
        Cashier_name: Name_Customer,
        customOrderOptions: order_options_method,
        selectedTable: selectedTable,

        snap: user.companySocialMediaSnap,
        website: user.companyWebsiteLink,
        tell: user.companyPhoneNumber,

        // items ======================================
        Invoice_items: Send_items_Print,
        // --------------------------------------------
        Discount_value: '10',
        tax: tax,
        Total_amount: total,
        qr_code: 'val.qr_code',
        cash_Payment: cash_Payment,
        network_Payment: network_Payment,
      ));

      Snak_Bar(context, 'جاري طباعة الفاتورة');

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          //
          // Future.delayed(Duration(seconds: 5), () {
          //   pop(context);
          // });

          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(child: Text('Printing', style: TextStyle(color: Theme.of(context).colorScheme.primary))),
            content: Print_Big_Invoice(
              Tax_number: Data_Print[0].Tax_number,
              Invoice_Number: Data_Print[0].Invoice_Number,
              customOrderOptions: Data_Print[0].customOrderOptions,

              selectedTable: selectedTable,
              // --------------------------------------------------
              Date: Data_Print[0].Date,
              Cashier_name: Data_Print[0].Cashier_name,
              Discount_value: Data_Print[0].Discount_value,
              Total_amount: Data_Print[0].Total_amount,
              Invoice_items: Data_Print[0].Invoice_items,
              tax: Data_Print[0].tax,
              company_name: Data_Print[0].company_name,
              branch: Data_Print[0].branch,
              company_address: Data_Print[0].company_address,
              snap: Data_Print[0].snap,
              website: Data_Print[0].website,
              tell: Data_Print[0].tell,
              //
              cash_Payment: Data_Print[0].cash_Payment,
              network_Payment: Data_Print[0].network_Payment,

              qr: Data_Print[0].qr_code,
            ),
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

    notifyListeners();
  }

  // Fetch_Payment_Method  =============================================

  Fetch_Payment_Method(context) async {
    List_Type_Payment = await Api().Api_Get_Payment_Method(context);

    notifyListeners();
  }

  // Fetch Order Options Method  =======================================

  Fetch_Order_Options_Method(context) async {
    await Api().Api_Get_Order_Options_Method(context).then((value) {
      List_Order_Options = value.data;
    });

    print(List_Order_Options!);
    notifyListeners();
  }

  // Fetch_Payment_Method  =============================================

  Fetch_Serial_Number(BuildContext context) async {
    List_Serial_Number = [];
    ModelSerialNumber? modelSerialNumber = await Api().Api_Get_Serial_Number_Invoice(context);

    if (modelSerialNumber != null) {
      List_Serial_Number = modelSerialNumber.message;
    } else {
      List_Serial_Number = [];
    }

    notifyListeners();
  }
}
