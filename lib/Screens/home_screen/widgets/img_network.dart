// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget custom_img_Network(String img, {double? h, double? w, double? circular}) {
  return img == ''
      ? Image.asset(
          'assets/images/error.png',
          height: h,
          width: w,
          fit: BoxFit.fill,
        )
      : ClipRRect(
          borderRadius: BorderRadius.circular(circular ?? 5),
          child: CachedNetworkImage(
            height: h,
            width: w,
            fit: BoxFit.fill,
            imageUrl: img,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Image.asset('assets/images/error.png', height: h, width: w, fit: BoxFit.fill),
          ),
        );
}
