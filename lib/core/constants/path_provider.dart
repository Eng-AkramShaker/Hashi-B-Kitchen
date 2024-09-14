import 'package:face_auth_flutter/core/theme/theme_provider.dart';
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
import 'package:face_auth_flutter/data/provider/auth/register.dart';
import 'package:face_auth_flutter/data/provider/kitchen/kitchen_provider.dart';
import 'package:face_auth_flutter/data/provider/return_invoice/return.dart';

import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';

import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/data/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/data/provider/upload_All_invoices/upload_All_invoices.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => ThemeProvider()),
  ChangeNotifierProvider(create: (ctx) => Login_Provider()),
  ChangeNotifierProvider(create: (ctx) => Register_Provider()),
  ChangeNotifierProvider(create: (ctx) => Categories_Provider()),
  ChangeNotifierProvider(create: (ctx) => Invoice_Provider()),
  ChangeNotifierProvider(create: (ctx) => Shift_Provider()),
  ChangeNotifierProvider(create: (ctx) => Cost_Sharing_Provider()),
  ChangeNotifierProvider(create: (ctx) => Orders_Provider()),
  ChangeNotifierProvider(create: (ctx) => Return_Provider()),
  ChangeNotifierProvider(create: (ctx) => Printer_Provider()),

  //  Hive  =============================================================================

  ChangeNotifierProvider(create: (ctx) => Hive_User_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Lock_Screen_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Open_Shift_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Group_Product_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_All_Product_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Customers_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Get_Payment_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Order_Options_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Serial_Number_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_get_all_orders_Provider()),
  ChangeNotifierProvider(create: (ctx) => Hive_Best_Seller_Provider()),

  // Hive  Upload All invoices  --------------------------------------------------------
  ChangeNotifierProvider(create: (ctx) => Hive_Upload_All_invoices()),
  ChangeNotifierProvider(create: (ctx) => Upload_All_invoices_Provider()),

  //

  ChangeNotifierProvider(create: (ctx) => Kitchen_Provider()),
];
