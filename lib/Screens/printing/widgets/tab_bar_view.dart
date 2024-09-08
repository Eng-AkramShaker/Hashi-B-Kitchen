// ignore_for_file: camel_case_types

import 'package:face_auth_flutter/Screens/printing/ip_address_screens/create_ip_addres.dart';
import 'package:face_auth_flutter/Screens/printing/ip_address_screens/get_ip_addres.dart.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/shift_provider/shift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarView_Customer extends StatefulWidget {
  const TabBarView_Customer({super.key});

  @override
  _TabBarView_CustomerState createState() => _TabBarView_CustomerState();
}

class _TabBarView_CustomerState extends State<TabBarView_Customer> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider>(
        builder: (context, provCategory, proInvoice, provLogin, provShift, child) {
      return SizedBox(
        width: 500,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(icon: Icon(Icons.print, color: Theme.of(context).colorScheme.onSecondary), text: 'IP Address'),
                Tab(icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary), text: 'Create IP Address'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Get_ip_address(),
                  Create_ip_address(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
