// ignore_for_file: non_constant_identifier_names, camel_case_types, avoid_print

import 'package:face_auth_flutter/Screens/home_screen/widgets/option_Item.dart';
import 'package:face_auth_flutter/data/models/kitchen/submit_Kitchen_model.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/kitchen/kitchen_provider.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/widgets/divider/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Submit_Screen extends StatefulWidget {
  const Submit_Screen({super.key});

  @override
  _Submit_ScreenState createState() => _Submit_ScreenState();
}

class _Submit_ScreenState extends State<Submit_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final provCategory = Provider.of<Categories_Provider>(context);
    final pro_Printer = Provider.of<Printer_Provider>(context, listen: false);
    final proKitchen = Provider.of<Kitchen_Provider>(context);

    return Column(
      children: [
        //
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: OptionItem(
                  isSelected: provCategory.index_Delivery == 0,
                  icon: Icons.store,
                  text: 'All',
                  onPressed: () {
                    setState(() {
                      provCategory.index_Delivery = 0;
                      proKitchen.selectedFilter = 'All';
                    });
                  },
                ),
              ),
              OptionItem(
                isSelected: provCategory.index_Delivery == 1,
                icon: Icons.store,
                text: 'Dine In',
                onPressed: () {
                  setState(() {
                    provCategory.index_Delivery = 1;
                    proKitchen.selectedFilter = 'Dine In';
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: OptionItem(
                  isSelected: provCategory.index_Delivery == 2,
                  icon: Icons.directions_walk,
                  text: 'Pick Up',
                  onPressed: () {
                    setState(() {
                      provCategory.index_Delivery = 2;
                      proKitchen.selectedFilter = 'Pick Up';
                    });
                  },
                ),
              ),
              OptionItem(
                isSelected: provCategory.index_Delivery == 3,
                icon: Icons.local_shipping,
                text: 'Delivery',
                onPressed: () {
                  setState(() {
                    provCategory.index_Delivery = 3;
                    proKitchen.selectedFilter = 'Delivery';
                  });
                },
              ),
            ],
          ),
        ),
        build_kitchen_requests(provCategory, pro_Printer, size),
      ],
    );
  }
}

Widget build_kitchen_requests(Categories_Provider provCategory, Printer_Provider proPrinter, Size size) {
  return Expanded(
    child: Consumer4<Categories_Provider, Invoice_Provider, Login_Provider, Kitchen_Provider>(
      builder: (context, provCategory, proInvoice, provLogin, proKitchen, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              proKitchen.data_All_Submit_Kitchen != null
                  ? SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: proKitchen.getFilteredDeliveries(proKitchen.data_All_Submit_Kitchen).length,
                        (context, index) {
                          final item = proKitchen.getFilteredDeliveries(proKitchen.data_All_Submit_Kitchen!)[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card_kitchen_invoice(context, proKitchen, item, size),
                          );
                        },
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: SizedBox(),
                    ),
            ],
          ),
        );
      },
    ),
  );
}

Widget Card_kitchen_invoice(BuildContext context, Kitchen_Provider pro_Kitchen, Delivery item, Size size) {
  String order_type = pro_Kitchen.Select_order_type(item.orderType.toString());
  return Card(
    color: Theme.of(context).colorScheme.background,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('# ${item.salesInvoice != null ? item.salesInvoice!.split("-").sublist(2).join("-") : 56565552}',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                children: [
                  const Icon(Icons.restaurant_menu, size: 18),
                  const SizedBox(width: 8),
                  Text(order_type, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.person_outline, size: 18),
                  SizedBox(width: 8),
                  Text('Default Customer', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Icon(Icons.restaurant_menu, size: 18),
                    SizedBox(width: 8),
                    Text('Table  ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        const Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: EdgeInsets.all(8.0), child: Text('Food Item', style: TextStyle(fontWeight: FontWeight.bold))),
              Padding(padding: EdgeInsets.all(8.0), child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        Expanded(
          child: item.items.isNotEmpty
              ? ListView.builder(
                  itemCount: item.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = item.items[index];
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(padding: const EdgeInsets.only(left: 10), child: Text('${data.itemCode}')),
                              Padding(padding: const EdgeInsets.only(right: 30), child: Text('${data.qty}')),
                            ],
                          ),
                          const SizedBox(height: 10),
                          custom_divider(h: 1, color: Theme.of(context).colorScheme.onSecondary),
                        ],
                      ),
                    );
                  },
                )
              : const SizedBox(),
        ),
        const SizedBox(height: 5),
      ],
    ),
  );
}
