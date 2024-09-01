// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

class Model_Print {
  var Invoice_Number;
  var Tax_number;
  var Date;

  var Cashier_name;
  var Discount_value;
  var Total_amount;

  var branch;
  var company_name;
  var company_address;
  var snap;

  var website;
  var tell;

  var tax;
  var customOrderOptions;

  var selectedTable;

  List<Map<String, dynamic>> Invoice_items;

  var qr_code;

  var cash_Payment;
  var network_Payment;

//

  Model_Print({
    required this.Invoice_Number,
    required this.Tax_number,
    required this.Date,
    required this.Cashier_name,
    required this.Discount_value,
    required this.Total_amount,
    required this.Invoice_items,
    //
    required this.branch,
    required this.company_name,
    required this.company_address,
    required this.snap,
    required this.website,
    required this.tell,
    //
    required this.tax,
    required this.customOrderOptions,
    required this.selectedTable,

    //
    required this.qr_code,
    required this.cash_Payment,
    required this.network_Payment,
  });
}
