// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_null_comparison

import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/tab_bar_view.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';

import 'package:face_auth_flutter/data/provider/auth/Login.dart';

import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/cards/empty.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dropdown_My_Account extends StatefulWidget {
  final onChanged;
  const Dropdown_My_Account({super.key, this.onChanged});

  @override
  State<Dropdown_My_Account> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<Dropdown_My_Account> {
  final List<dynamic> items = [
    {'name': 'All Printing'},
    {'name': 'Single Printing'},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer4<Invoice_Provider, Cost_Sharing_Provider, Login_Provider, Printer_Provider>(
      builder: (context, proInvoice, proCostSharing, provLogin, proPrinter, child) {
        return GestureDetector(
          onTap: () async {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset offset = renderBox.localToGlobal(Offset.zero);

            await proPrinter.get_Print_DataBase();

            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(
                offset.dx,
                offset.dy + renderBox.size.height,
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
              items: [
                PopupMenuItem<int>(
                  value: 0,
                  child: SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provLogin.user!.name.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.print,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          title: Text('IP-Print',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSecondary,
                              )),
                          onTap: () async {
                            // print

                            get_Create_IPaddress(proInvoice, proCostSharing, proPrinter);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          title: const Text('Logout', style: TextStyle(color: Colors.red)),
                          onTap: () {
                            // Handle logout

                            pushNewScreen(context, const Login_OTP_Screen());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          child: Container_Empty(
            Padding: 5,
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, size: 18, color: Colors.white),
                ),
                const SizedBox(width: 8),
                Custom_Text(text: 'My Account', size: 13),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  get_Create_IPaddress(Invoice_Provider proInvoice, Cost_Sharing_Provider proCostSharing, Printer_Provider proPrinter) async {
    //
    var size = MediaQuery.of(context).size;

    return Snack_Select_Menu(
        context: context,
        backgColor: Theme.of(context).colorScheme.primaryContainer,
        widget: SizedBox(height: size.height / 2, child: const TabBarView_Customer()),
        onPressed: () async {
          //

          if (proPrinter.IPAddress.text != null && proPrinter.Name_IPAddress.text != null) {
            //

            await proPrinter.Create_Print_DataBase(
              context: context,
              print_name: proPrinter.Name_IPAddress.text,
              print_ip: proPrinter.IPAddress.text,
            );
          }
          await proPrinter.get_Print_DataBase();

          pop(context);
        });
  }
}
