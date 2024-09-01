// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, prefer_typing_uninitialized_variables, unused_local_variable, await_only_futures

import 'package:face_auth_flutter/data/services/Customer_api.dart';
import 'package:flutter/material.dart';
import '../../data/models/group_product _model.dart';
import '../../data/models/item_model.dart';
import '../../data/services/api.dart';

class Categories_Provider with ChangeNotifier {
// --------------------------------------

  bool isLoading = false;
  GroupProductModel? Items_group_product;
  int selectedCategory = 0;

  // --------------------------------------

  int number = 1;

  int index_Delivery = 0;

  TextEditingController text_Note = TextEditingController();

  // Customers ---------------------------------------

  List listCustomers = [];

  TextEditingController Type_controlle = TextEditingController();

  TextEditingController Name_controlle = TextEditingController();
  TextEditingController Tax_Number_controlle = TextEditingController();
  TextEditingController Commercial_Register_controlle = TextEditingController();
  TextEditingController Country_controlle = TextEditingController();
  TextEditingController City_controlle = TextEditingController();
  TextEditingController Detailed_Address_controlle = TextEditingController();

  // Search =======================================

  List<SearchItem> items_Search = [];
  String searchText = '';
  TextEditingController controller = TextEditingController();

  //  fetch_group_product   ======================================================================

  fetch_group_product(context) async {
    await Api().fetch_group_product_Api(context).then((value) {
      Items_group_product = value;

      isLoading = true;
      notifyListeners();
    });
  }

  // Get List Details Customers  ===============================================================

  fetch_Details_Customers(context) async {
    listCustomers = [];

    var allItems = await Customer_Api().Api_get_Details_Customers(context);

    if (allItems != null) {
      listCustomers = allItems;

      notifyListeners();
    } else {
      print('Failed to fetch customer details.');
    }
  }

  // Send Customer Create  =====================================================================

  Future<void> Send_Customer_Create({
    required BuildContext context,
    required String customer_name,
    required String? commercial_registration,
    required String? tax_id,
    required String? address_title,
    required String? address_line1,
    required String? address_in_arabic,
    required String? address_line2,
    required String? city,
    required String? state,
    required String? country,
    required String? pincode,
    required String? fax,
    required String? email,
    required String? phone,
    required String customer_type,
  }) async {
    // Snak_Bar(context, "أنتظر التحميل");

    await Customer_Api().Api_Send_Customer_Create(
      context: context,
      customer_name: customer_name,
      commercial_registration: commercial_registration,
      tax_id: tax_id,
      address_title: address_title,
      address_line1: address_line1,
      address_in_arabic: address_in_arabic,
      address_line2: address_line2,
      city: city,
      state: state,
      country: country,
      pincode: pincode,
      fax: fax,
      email: email,
      phone: phone,
      customer_type: customer_type,
    );

    // Fetch the updated list of customers
    await fetch_Details_Customers(context);
  }
}
