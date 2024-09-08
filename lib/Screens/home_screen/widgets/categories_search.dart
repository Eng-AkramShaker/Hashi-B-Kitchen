// // ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_null_comparison, camel_case_types, non_constant_identifier_names, unused_local_variable, avoid_print

// import 'package:face_auth_flutter/data/models/item_model.dart';
// import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
// import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../core/constants/config.dart';
// import '../../../widgets/show_snack/Snack_Bar.dart';
// import '../../../widgets/show_snack/select_menu.dart';
// import 'menu.dart';

// class Search_Categories extends StatefulWidget {
//   const Search_Categories({super.key});

//   @override
//   State<Search_Categories> createState() => _new_searchState();
// }

// class _new_searchState extends State<Search_Categories> {
//   @override
//   void initState() {
//     super.initState();

//     intS();
//   }

//   intS() async {
//     final provCategory = Provider.of<Categories_Provider>(context, listen: false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
//       return Column(
//         children: [
//           TextField(
//             controller: provCategory.controller,
//             decoration: const InputDecoration(
//               hintText: 'Enter your search query',
//             ),
//             onChanged: (value) {
//               setState(() {
//                 provCategory.searchText = value;
//               });
//             },
//           ),
//           const SizedBox(height: 10),
//           Container(
//             height: 40.h,
//             width: 25.w,
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: provCategory.items_Search.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final SearchItem person = provCategory.items_Search[index];

//                 if (provCategory.searchText.isNotEmpty && !person.name.contains(provCategory.searchText)) {
//                   return const SizedBox.shrink();
//                 }

//                 var price = double.parse(person.price_rate.toString());

//                 int stock_qty =
//                     double.parse(provCategory.model_items[person.index_group]![person.index_category].stock_qty.toString()).toInt();

//                 // =-----------
//                 Item item = provCategory.model_items[person.index_group]![person.index_category];

//                 return InkWell(
//                   onTap: () {
//                     //
//                     Snack_Select_Menu(
//                       context: context,
//                       widget: widget_Menu(
//                         img: person.image == null ? 'null' : Config.base_image + person.image!,
//                         price: double.parse('$price'),
//                         stock_qty: stock_qty,
//                       ),
//                       onPressed: () async {
//                         //

//                         if (stock_qty == 0) {
//                           Snak_Bar(context, "نفذ الكمية ");
// //
//                         } else if (stock_qty > 0) {
//                           if (provCategory.number == 1 && price != provCategory.Menu_total) {
//                             price *= provCategory.number;

//                             //

//                             if (stock_qty >= provCategory.number) {
//                               provCategory.model_items[person.index_group]![person.index_category].stock_qty =
//                                   (stock_qty - provCategory.number).toString();

//                               person.stock_qty = (stock_qty - provCategory.number).toString();

//                               // print(stock_qty);
//                             }

//                             //
//                           } else if (provCategory.number > 1 && price != provCategory.Menu_total) {
//                             price *= provCategory.number;

//                             if (stock_qty >= provCategory.number) {
//                               provCategory.model_items[person.index_group]![person.index_category].stock_qty =
//                                   (stock_qty - provCategory.number).toString();

//                               person.stock_qty = (stock_qty - provCategory.number).toString();
//                             }
//                           }

//                           provCategory.add_Item(
//                             group_Index: person.index_group,
//                             category_Index: person.index_category,
//                             price: price.toString(),
//                             stock_qty: person.stock_qty,
//                             numbers: provCategory.number,
//                             item: item,
//                           );

//                           await provCategory.cal_Total();
//                           await pro_Invoice.add_One_item_To_Sales_Invoice(
//                             name: person.name,
//                             qty: provCategory.number,
//                             price: person.price_rate.toString(),
//                           );
//                         }
//                         // print(item);

//                         provCategory.details = '';
//                         provCategory.number = 1;
//                         provCategory.Menu_total = 0;

//                         Navigator.of(context).pop();
//                         Navigator.of(context).pop();
//                       },
//                     );
//                   },
//                   child: ListTile(
//                     title: Text(person.name),
//                     subtitle: Text('Price: $price ,  Stock Quantity: $stock_qty'),
//                     leading: person.image != null && person.image != 'null'
//                         ? Image.network(Config.base_image + person.image!)
//                         : Image.asset('assets/images/empty.jpg', height: 8.h, width: 5.w, fit: BoxFit.fill),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
