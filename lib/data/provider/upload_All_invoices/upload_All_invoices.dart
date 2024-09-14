// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_conditional_assignment, unused_local_variable

import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/data/services/invoices/seals_api.dart';
import 'package:face_auth_flutter/widgets/show_snack/Snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Upload_All_invoices_Provider with ChangeNotifier {
  //

  // End Shift ====================================================================================================

  Upload_All_Invoices_To_Api(BuildContext context, {required Hive_Upload_All_invoices hive_Upload_All}) async {
    //

    bool result = await InternetConnectionChecker().hasConnection;

    if (result == true) {
      print('++++++++++++++++  yes internet');

      if (hive_Upload_All.data.isNotEmpty) {
        await Snak_Bar(context, "انتظر حتي يكتمل رفع الفواتير المحفوظه");
        for (var i = 0; i < hive_Upload_All.data.length; i++) {
          print('=========================== $i  ===============================');

          List<dynamic> list_items = hive_Upload_All.data[i]['List_items'];

          List<Map<String, dynamic>> convertedList = list_items.map((item) {
            if (item is Map<String, dynamic>) {
              return item;
            } else {
              return Map<String, dynamic>.from(item as Map);
            }
          }).toList();

          await Api_Send_Sales_Invoice(
            context,
            hive_Upload_All.data[i]['branch'],
            hive_Upload_All.data[i]['Date_Now'],
            hive_Upload_All.data[i]['Name_Customer'],
            convertedList,
            "Cash",
            10,
            hive_Upload_All.data[i]['order_options'],
          );

          print(convertedList);
        }
        Snak_Bar(context, "تم رفع جميع الفواتير بنجاح");

        await hive_Upload_All.delete_Upload_All_invoices();
        print(hive_Upload_All.data);
      }
    } else {
      print('++++++++++++++++++++ no internet');
    }
  }
}
