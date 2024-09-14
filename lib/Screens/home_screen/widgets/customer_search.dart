// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, camel_case_types, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/constants/navigators.dart';

class Search_Customer extends StatefulWidget {
  const Search_Customer({super.key});

  @override
  State<Search_Customer> createState() => _new_searchState();
}

class _new_searchState extends State<Search_Customer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
      return Column(
        children: [
          TextField(
            controller: provCategory.controller,
            decoration: const InputDecoration(
              hintText: 'Enter your search query',
              fillColor: wtColor,
            ),
            onChanged: (value) {
              setState(() {
                provCategory.searchText = value;
              });
            },
          ),
          const SizedBox(height: 10),
          Container(
            height: 40.h,
            width: 20.w,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provCategory.listCustomers.length,
              itemBuilder: (BuildContext context, int index) {
                final customers = provCategory.listCustomers[index];

                if (provCategory.searchText.isNotEmpty && !customers['customer_name'].contains(provCategory.searchText)) {
                  return const SizedBox.shrink();
                }

                return InkWell(
                  onTap: () {
                    //
                    setState(() {
                      pro_Invoice.nameCustomer = customers['customer_name'].toString();
                    });
                    print(customers['customer_name']);
                    pop(context);
                  },
                  child: ListTile(
                    title: Center(
                        child: Text(
                      customers['customer_name'],
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
