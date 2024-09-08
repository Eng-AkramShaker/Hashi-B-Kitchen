// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, avoid_print, unused_local_variable

import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import '../../../core/constants/config.dart';
import '../../../widgets/cards/costume_card.dart';
import '../../../data/models/group_product _model.dart';
import '../../../widgets/show_snack/Snack_Bar.dart';

Widget Menu_Products({required context, required Categories_Provider provCategory, required List<Item> items}) {
  var size = MediaQuery.of(context).size;

  return Consumer3<Categories_Provider, Invoice_Provider, Login_Provider>(
      builder: (context, provCategory, pro_Invoice, prov_Login, child) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: items.length,
              (context, index) {
                String img = items[index].image.toString();
                String name = items[index].name.toString();
                double price = double.parse(items[index].priceRate.toString());
                int stock_qty = double.parse(items[index].stockQty.toString()).toInt();

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      if (stock_qty == 0) {
                        Snak_Bar(context, "نفذ الكمية ");
                      } else if (stock_qty > 0) {
                        // if (provCategory.number == 1 && price != provCategory.Menu_total) {
                        //   price *= provCategory.number;
                        //   if (stock_qty >= provCategory.number) {
                        //     provCategory.model_items[provCategory.selectedCategory]![index].stock_qty =
                        //         (stock_qty - provCategory.number).toString();
                        //     // print(stock_qty);
                        //   }
                        //   //
                        // } else if (provCategory.number > 1 && price != provCategory.Menu_total) {
                        //   price *= provCategory.number;
                        //   if (stock_qty >= provCategory.number) {
                        //     provCategory.model_items[provCategory.selectedCategory]![index].stock_qty =
                        //         (stock_qty - provCategory.number).toString();
                        //   }
                        // }

                        await pro_Invoice.add_One_item_To_Sales_Invoice(
                          name: name,
                          qty: provCategory.number,
                          price: price.toString(),
                        );
                      }

                      await pro_Invoice.cal_Total();
                      print(provCategory.number);

                      print(pro_Invoice.main_List_Invoice);

                      provCategory.number = 1;
                    },
                    child: Costume_card(
                      context,
                      img: img == 'null' ? 'null' : '${Config.base_image + img}',
                      title: name,
                      price: price.toString(),
                      stock_qty: stock_qty.toString(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  });
}
