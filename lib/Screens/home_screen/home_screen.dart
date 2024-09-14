// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable, unused_element, camel_case_types, sized_box_for_whitespace, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables

import 'package:face_auth_flutter/Screens/home_screen/kitchen/body_kitchen.dart';
import 'package:face_auth_flutter/Screens/home_screen/pos/body_pos.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/app_bar.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<String> tabs = ['Pos', 'kitchen'];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final pro_Printer = Provider.of<Printer_Provider>(context, listen: false);

    return Consumer6<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider, Cost_Sharing_Provider, Orders_Provider>(
      builder: (context, provCategory, proInvoice, provLogin, prov_sharing, proCostSharing, prov_Orders, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: Custom_App_Bar(context, _tabController, tabs, prov_sharing),
            body: TabBarView(
              controller: _tabController,
              children: [
                const Pos_Screen(),
                const kitchen_Screen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
