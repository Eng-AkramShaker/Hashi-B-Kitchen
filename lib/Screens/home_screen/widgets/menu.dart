// ignore_for_file: must_be_immutable, camel_case_types, sized_box_for_whitespace, unused_local_variable, avoid_print, non_constant_identifier_names

import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../widgets/Buttons/text_button.dart';
import '../../../widgets/show_snack/Snack_Bar.dart';
import '../../../widgets/texts/custom_text.dart';

class widget_Menu extends StatefulWidget {
  late String img;
  late double price;
  late int stock_qty;
  widget_Menu({super.key, required this.img, required this.price, required this.stock_qty});

  @override
  State<widget_Menu> createState() => _Custom_widgetState();
}

class _Custom_widgetState extends State<widget_Menu> {
  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);

    setState(() {
      // provCategory.Menu_total = widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<Categories_Provider>(builder: (context, provider, _) {
      return SizedBox(
        height: 36.h,
        width: 30.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: widget.img != 'null'
                      ? Image.network(widget.img, height: 20.h, width: size.width / 2, fit: BoxFit.fill)
                      : Image.asset('assets/images/empty.jpg', height: 20.h, width: size.width / 2, fit: BoxFit.fill),
                ),
                const SizedBox(height: 20),
                // L M S -------------------------------------

                const Divider(),

                // count --------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text_Button(
                      context: context,
                      text: '-',
                      size_text: 20,
                      backgroundColor: Colors.teal,
                      onPressed: () {
                        setState(() {
                          //
                          if (provider.number != 1) {
                            provider.number -= 1;
                          }
                        });
                      },
                    ),
                    Custom_Text(text: '${provider.number}', size: 23),
                    Text_Button(
                      context: context,
                      text: '+',
                      size_text: 20,
                      backgroundColor: green_Color,
                      onPressed: () {
                        setState(() {
                          //

                          if (provider.number < widget.stock_qty) {
                            provider.number += 1;
                          } else {
                            Snak_Bar(context, "نفذ الكمية ");
                          }
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                // ==========================================
              ],
            ),
          ],
        ),
      );
    });
  }
}
