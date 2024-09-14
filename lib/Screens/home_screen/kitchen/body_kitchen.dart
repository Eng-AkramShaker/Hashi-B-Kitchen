// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable, unused_element, camel_case_types, sized_box_for_whitespace, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_field

import 'package:face_auth_flutter/Screens/home_screen/kitchen/draft_screen.dart';
import 'package:face_auth_flutter/Screens/home_screen/kitchen/submit_screen.dart';
import 'package:face_auth_flutter/Screens/home_screen/kitchen/widget/custom_appbar_Kitchen.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/option_Item.dart';
import 'package:face_auth_flutter/data/models/kitchen/draft_Kitchen_model.dart';
import 'package:face_auth_flutter/data/provider/kitchen/kitchen_provider.dart';
import 'package:face_auth_flutter/widgets/divider/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/data/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';

class kitchen_Screen extends StatefulWidget {
  const kitchen_Screen({Key? key}) : super(key: key);

  @override
  State<kitchen_Screen> createState() => _kitchen_ScreenState();
}

class _kitchen_ScreenState extends State<kitchen_Screen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final List<String> tabs = ['Draft', 'Submit'];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final pro_Printer = Provider.of<Printer_Provider>(context, listen: false);

    final pro_Kitchen = Provider.of<Kitchen_Provider>(context, listen: false);

    return Consumer6<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider, Cost_Sharing_Provider, Orders_Provider>(
      builder: (context, provCategory, proInvoice, provLogin, prov_sharing, proCostSharing, prov_Orders, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: Custom_AppBar(context, _tabController, tabs),
            body: TabBarView(
              controller: _tabController,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Draft_Screen()),
                Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Submit_Screen()),
              ],
            ),
          ),
        );
      },
    );
  }
}
