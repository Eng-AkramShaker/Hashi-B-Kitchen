import 'package:face_auth_flutter/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/provider/return_invoice/return.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/card_order.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Orders_Provider, Return_Provider>(builder: (context, provOrders, proReturn, child) {
      return SizedBox(
        height: 590,
        width: 490,
        child: ListView.builder(
          itemCount: provOrders.List_Order_invoice!.message.length,
          itemBuilder: (context, index) {
            final item = provOrders.List_Order_invoice!.message[index];
            return OrderCard(
              orderNo: item.name!,
              time: item.dueDate!.toString(),
              price: item.total!.toString(),
              customOrderOptions: item.customOrderOptions!.toString(),
              onTap: () async {
                //

                await proReturn.Return_Invoice(context: context, Serial_number: item.name);

                //
              },
            );
          },
        ),
      );
    });
  }
}
