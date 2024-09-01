// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';
import '../texts/custom_text.dart';

Widget Costume_card(context, {required String img, required String title, required String price, required String stock_qty}) {
  var size = MediaQuery.of(context).size;

  return Stack(
    children: [
      Card(
        color: Colors.transparent,
        child: Container(
          // height: 160,
          // width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              //
              Flexible(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: img != 'null'
                      ? Image.network(img, height: size.height, width: size.width, fit: BoxFit.fill)
                      : Image.asset('assets/images/empty.jpg', height: size.height, width: size.width, fit: BoxFit.fill),
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Text(title,
                        style: GoogleFonts.robotoSlab(
                            color: Theme.of(context).colorScheme.primary, fontSize: 11.sp, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('SR $price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp, color: redColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // ----------------------------------------------------------------------------------------

      Positioned(
        top: 10,
        left: 10,
        child: Container(
          //
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Custom_Text(text: stock_qty, size: 13, color: wtColor),

              //  Text('SR $price', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: bgColor)),
            ),
          ),
        ),
      ),
    ],
  );
}
