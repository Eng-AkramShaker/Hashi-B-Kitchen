// ignore_for_file: non_constant_identifier_names, unused_local_variable, camel_case_types, unrelated_type_equality_checks, avoid_print

import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/provider/upload_All_invoices/upload_All_invoices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

no_Internet_Body(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/no_internet.png',
          width: 30,
          height: 30,
        ),
        const SizedBox(height: 5),
        const Text('لا يوجد انترنت', style: TextStyle(fontSize: 13)),
      ],
    ),
  );
}

class check_internet extends StatefulWidget {
  const check_internet({super.key});

  @override
  State<check_internet> createState() => _check_internetState();
}

class _check_internetState extends State<check_internet> {
  @override
  Widget build(BuildContext context) {
    final upload_All_invoices_Hive = Provider.of<Hive_Upload_All_invoices>(context, listen: false);
    final pro_upload_Api = Provider.of<Upload_All_invoices_Provider>(context, listen: false);

    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          print('Connected to the Internet  ');

          pro_upload_Api.Upload_All_Invoices_To_Api(context, hive_Upload_All: upload_All_invoices_Hive);
        } else {
          print('Disconnected from the Internet  ');
        }

        return connected
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Offline',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, fontFamily: 'Tajawal'),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/no_internet.png', width: 28, height: 28),
                  ],
                ),
              );
      },
      child: Container(),
    );
  }
}
 


//  bool result = await InternetConnectionChecker().hasConnection;
//   if (result == true) {
//     print('++++++++++++++++  yes internet');
//   } else {
//     print('++++++++++++++++++++ no internet');
//   }
