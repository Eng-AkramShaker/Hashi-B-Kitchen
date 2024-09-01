// ignore_for_file: avoid_print, camel_case_types, prefer_typing_uninitialized_variables

import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/widgets/cards/empty.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';

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
    return Consumer3<Invoice_Provider, Cost_Sharing_Provider, Login_Provider>(
      builder: (context, proInvoice, proCostSharing, provLogin, child) {
        return GestureDetector(
          onTap: () {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final Offset offset = renderBox.localToGlobal(Offset.zero);

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
}
