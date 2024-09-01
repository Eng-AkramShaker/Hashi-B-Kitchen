// ignore_for_file: camel_case_types

import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Select_Tablet extends StatefulWidget {
  const Select_Tablet({super.key});

  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select_Tablet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Invoice_Provider>(builder: (context, proInvoice, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0), // مساحة خارجية حول الـ GridView
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // عدد الأعمدة
            crossAxisSpacing: 10, // المسافة بين الأعمدة
            mainAxisSpacing: 30, // المسافة بين الصفوف
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            String label = index == 0
                ? 'T14'
                : index == 1
                    ? 'T15'
                    : index == 2
                        ? 'T16'
                        : index == 3
                            ? 'T17'
                            : 'T18';

            return GestureDetector(
              onTap: () {
                setState(() {
                  proInvoice.selectedTable = label;
                  print(proInvoice.selectedTable);
                });
              },
              child: TableCard(
                label: label,
                isSelected: proInvoice.selectedTable == label,
              ),
            );
          },
        ),
      );
    });
  }
}

class TableCard extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TableCard({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.background,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/table.png',
              height: 110,
              width: 110,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
