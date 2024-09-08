// ignore_for_file: non_constant_identifier_names, avoid_print, file_names, unused_local_variable, await_only_futures

import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_all_product.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_best_seller.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_all_orders.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_customers.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_get_payment.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_group_product.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_order_options.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_serial_number.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/lock_screen.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/upload_All_invoices/upload_All_invoices.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Int_Hive() async {
  await Hive.initFlutter();

  await Hive.openBox('user');
  await Hive.openBox('lock_screen');

  await Hive.openBox('openShift');
  await Hive.openBox('group_product');
  await Hive.openBox('all_Product');
  await Hive.openBox('Customers');
  await Hive.openBox('Payment');
  await Hive.openBox('OrderOptions');
  await Hive.openBox('serialnumber');
  await Hive.openBox('get_all_orders');
  await Hive.openBox('best_seller');

  await Hive.openBox('upload_All_invoices');
}

// -------------------------------------------------------------------------------------------------

Fetch_All_Data_Hive({required context}) async {
  //
  final provLogin = Provider.of<Login_Provider>(context, listen: false);

  final user_Hive = Provider.of<Hive_User_Provider>(context, listen: false);
  final lock_Screen_Hive = Provider.of<Hive_Lock_Screen_Provider>(context, listen: false);

  final open_shift_Hive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);
  final group_product_Hive = Provider.of<Hive_Group_Product_Provider>(context, listen: false);
  final all_Product_Hive = Provider.of<Hive_All_Product_Provider>(context, listen: false);
  final customers_Hive = Provider.of<Hive_Customers_Provider>(context, listen: false);
  final payment_Hive = Provider.of<Hive_Get_Payment_Provider>(context, listen: false);
  final Order_Options_Hive = Provider.of<Hive_Order_Options_Provider>(context, listen: false);
  final Serial_Number_Hive = Provider.of<Hive_Serial_Number_Provider>(context, listen: false);
  final get_all_orders_Hive = Provider.of<Hive_get_all_orders_Provider>(context, listen: false);
  final best_Seller_Hive = Provider.of<Hive_Best_Seller_Provider>(context, listen: false);
  final upload_All_invoices_Hive = Provider.of<Hive_Upload_All_invoices>(context, listen: false);
  final pro_upload_Api = Provider.of<Upload_All_invoices_Provider>(context, listen: false);

  //

  await user_Hive.get_Hive_User();
  await lock_Screen_Hive.get_Hive_Lock_Screen();

  await open_shift_Hive.get_Hive_Open_Shift();
  await group_product_Hive.get_Hive_Group_Product();
  await all_Product_Hive.get_Hive_All_Product();

  await upload_All_invoices_Hive.get_Hive_Upload_All_invoices();

  customers_Hive.get_Hive_Customers();
  payment_Hive.get_Hive_Payment();
  Order_Options_Hive.get_Hive_Order_Options();
  Serial_Number_Hive.get_Hive_Serial_Number();
  best_Seller_Hive.get_Hive_Best_Seller();
}

// --------------------------------------------------------------------------------------------------------------

Delete_All_openBox_Hive({required context}) async {
  //
  final user_Hive = Provider.of<Hive_User_Provider>(context, listen: false);
  final lock_Screen_Hive = Provider.of<Hive_Lock_Screen_Provider>(context, listen: false);

  final open_shift_Hive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);
  final group_product_Hive = Provider.of<Hive_Group_Product_Provider>(context, listen: false);
  final all_Product_Hive = Provider.of<Hive_All_Product_Provider>(context, listen: false);
  final customers_Hive = Provider.of<Hive_Customers_Provider>(context, listen: false);
  final payment_Hive = Provider.of<Hive_Get_Payment_Provider>(context, listen: false);
  final Order_Options_Hive = Provider.of<Hive_Order_Options_Provider>(context, listen: false);
  final Serial_Number_Hive = Provider.of<Hive_Serial_Number_Provider>(context, listen: false);
  final get_all_orders_Hive = Provider.of<Hive_get_all_orders_Provider>(context, listen: false);
  final best_Seller_Hive = Provider.of<Hive_Best_Seller_Provider>(context, listen: false);
  final Upload_All_invoices_Hive = Provider.of<Hive_Upload_All_invoices>(context, listen: false);

  await user_Hive.get_Hive_User();
  await lock_Screen_Hive.get_Hive_Lock_Screen();
  await open_shift_Hive.get_Hive_Open_Shift();
  await group_product_Hive.get_Hive_Group_Product();
  await all_Product_Hive.get_Hive_All_Product();
  await customers_Hive.get_Hive_Customers();
  await payment_Hive.get_Hive_Payment();
  await Order_Options_Hive.get_Hive_Order_Options();
  await Serial_Number_Hive.get_Hive_Serial_Number();
  await get_all_orders_Hive.get_Hive_get_all_orders();
  await best_Seller_Hive.get_Hive_Best_Seller();
  await Upload_All_invoices_Hive.get_Hive_Upload_All_invoices();

// ======================================================

  user_Hive.delete_User();
  lock_Screen_Hive.delete_Lock_Screen();
  open_shift_Hive.delete_Open_Shift();
  group_product_Hive.delete_Group_Product();
  all_Product_Hive.delete_All_Product();
  customers_Hive.delete_Customers();
  payment_Hive.delete_Payment();
  Order_Options_Hive.delete_Order_Options();
  Serial_Number_Hive.delete_Serial_Number();
  get_all_orders_Hive.delete_Hive_get_all_orders();
  best_Seller_Hive.delete_Best_Seller();
  Upload_All_invoices_Hive.delete_Upload_All_invoices();
}
