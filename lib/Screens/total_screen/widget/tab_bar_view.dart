// ignore_for_file: camel_case_types

import 'package:face_auth_flutter/Screens/total_screen/widget/customer_screens/first_page.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/customer_screens/second_page.dart';
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
                Tab(icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onSecondary), text: 'Customer Create'),
                Tab(icon: Icon(Icons.person, color: Theme.of(context).colorScheme.onSecondary), text: 'Customer Search'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  FirstPage_Customer(),
                  SecondPage_Customer(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
