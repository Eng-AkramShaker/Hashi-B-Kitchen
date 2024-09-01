import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final String orderNo;
  final String time;
  final String? table;
  final String price;
  final String customOrderOptions;

  final Function() onTap;

  const OrderCard(
      {super.key,
      required this.orderNo,
      required this.time,
      this.table,
      required this.price,
      required this.customOrderOptions,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Custom_Text(text: orderNo, size: 15, color: Theme.of(context).colorScheme.onSecondary, fontweight: FontWeight.bold),
                Custom_Text(text: time, size: 13, color: Theme.of(context).colorScheme.onSecondary, fontweight: FontWeight.bold),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Card(
                        color: redColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Custom_Text(
                            text: 'Return',
                            size: 12,
                            color: Theme.of(context).colorScheme.primaryContainer,
                            fontweight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Custom_Text(
                        text: 'Table ${table ?? 'T21'}',
                        size: 13,
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontweight: FontWeight.bold),
                  ],
                ),
                Row(
                  children: [
                    Custom_Text(
                        text: '\$$price', size: 14, color: Theme.of(context).colorScheme.onSecondary, fontweight: FontWeight.bold),
                    const SizedBox(width: 10),
                    Card(
                        color: green_Color,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Custom_Text(
                              text: customOrderOptions,
                              size: 12,
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontweight: FontWeight.bold),
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
