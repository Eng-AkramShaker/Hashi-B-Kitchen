// ignore_for_file: camel_case_types, unused_local_variable, non_constant_identifier_names, avoid_print, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:face_auth_flutter/Screens/closing_shift/end_day.dart';
import 'package:face_auth_flutter/core/constants/check_interner.dart';
import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/models/best_seller_model.dart';
import 'package:face_auth_flutter/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Top_Seller_Screen extends StatefulWidget {
  const Top_Seller_Screen({super.key});

  @override
  State<Top_Seller_Screen> createState() => _ClosingShiftState();
}

class _ClosingShiftState extends State<Top_Seller_Screen> {
  final List<Map<String, dynamic>> _items = [
    {'icon': Icons.add, 'title': 'طلب جديد'},
    {'icon': Icons.access_time, 'title': 'الحضور/الانصراف'},
    {'icon': Icons.bar_chart, 'title': 'التقارير'},
    {'icon': Icons.assignment, 'title': 'الطلبات'},
    {'icon': Icons.settings, 'title': 'إعدادات المنتجات'},
    {'icon': Icons.undo, 'title': 'إرجاع'},
    {'icon': Icons.card_giftcard, 'title': 'بطاقات الولاء'},
    {'icon': Icons.local_offer, 'title': 'الهدايا'},
    {'icon': Icons.store, 'title': 'أرصدة المخزن'},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer3<Categories_Provider, Invoice_Provider, Shift_Provider>(
        builder: (context, provCategory, proInvoice, provShift, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: check_internet(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      buildBestSellerCard(provShift),
                      const SizedBox(height: 16),
                      buildTimeManagementCard(provShift),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: (_items.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final firstItem = _items[index * 2];
                      final secondItem = index * 2 + 1 < _items.length ? _items[index * 2 + 1] : null;
                      return buildGridRow(firstItem, secondItem);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildBestSellerCard(Shift_Provider provShift) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Custom_Text(text: '14:07:36 اليوم', fontweight: FontWeight.normal, size: 12.sp),
                Custom_Text(text: 'الأعلى مبيعاً حسب الكمية العامة', fontweight: FontWeight.normal, size: 12.sp),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32.h,
                  width: 18.w,
                  child: ListView.builder(
                    itemCount: provShift.List_Best_Seller!.message.length,
                    itemBuilder: (context, index) {
                      Message message = provShift.List_Best_Seller!.message[index];
                      return Card(
                        color: w_grey_Color,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Custom_Text(text: '${message.totalQty}', color: bgColor, fontweight: FontWeight.bold, size: 12.sp),
                              Custom_Text(text: '${message.itemCode}', fontweight: FontWeight.normal, size: 12.sp),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.8,
                    backgroundColor: w_grey_Color,
                    valueColor: AlwaysStoppedAnimation(bluColor),
                    strokeWidth: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeManagementCard(Shift_Provider provShift) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(text: 'إدارة الوقت', fontweight: FontWeight.normal, size: 11.8.sp),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Custom_Text(text: '0 تسجيلات دخول', fontweight: FontWeight.normal, size: 11.8.sp),
                Custom_Text(text: 'تسجيلات الخروج', fontweight: FontWeight.normal, size: 11.8.sp),
              ],
            ),
            const SizedBox(height: 8),
            const Divider(),
            Custom_Text(text: 'عمليات', fontweight: FontWeight.normal, size: 12.sp),
            ListTile(
              trailing: Icon(Icons.attach_money, color: Theme.of(context).colorScheme.primary),
              title: Text('درج النقد 1', style: TextStyle(color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.right),
            ),
            buildGridItem(
              Icons.assignment_turned_in,
              title: 'إجراء نهاية اليوم',
              sizeIcon: 25,
              onTap: () {
                pushNewScreen(context, const End_Day_Screen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridRow(Map<String, dynamic> firstItem, Map<String, dynamic>? secondItem) {
    return InkWell(
      onTap: () {
        // Handle onTap event
      },
      child: Row(
        children: [
          Expanded(
            child: buildGridItem(firstItem['icon'], title: firstItem['title']),
          ),
          if (secondItem != null)
            Expanded(
              child: buildGridItem(secondItem['icon'], title: secondItem['title']),
            ),
          if (secondItem == null) const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }

  Widget buildGridItem(IconData icon, {double? sizeIcon, String? title, onTap}) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 4.0,
      margin: const EdgeInsets.all(4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: Icon(icon, size: sizeIcon ?? 50, color: Theme.of(context).colorScheme.primary),
          title: Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary), textAlign: TextAlign.right),
          onTap: onTap,
        ),
      ),
    );
  }
}
