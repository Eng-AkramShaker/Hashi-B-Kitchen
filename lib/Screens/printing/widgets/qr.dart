// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Widget_Qr extends StatelessWidget {
  // بيانات الفاتورة
  final sellerName;
  final vatNumber;
  final invoiceDate;
  final invoiceTotal;
  final vatAmount;

  const Widget_Qr({
    super.key,
    required this.sellerName,
    required this.vatNumber,
    required this.invoiceDate,
    required this.invoiceTotal,
    required this.vatAmount,
  });

  @override
  Widget build(BuildContext context) {
    // إنشاء رمز QR متوافق مع هيئة الزكاة والضرائب

    String qrData = generateQRCodeData(
      sellerName: sellerName,
      vatNumber: vatNumber,
      invoiceDate: invoiceDate,
      invoiceTotal: invoiceTotal,
      vatAmount: vatAmount,
    );

    return QrImageView(
      data: qrData,
      version: QrVersions.auto,
      size: 120.0,
    );
  }

  String generateQRCodeData({
    required String sellerName,
    required String vatNumber,
    required String invoiceDate,
    required String invoiceTotal,
    required String vatAmount,
  }) {
    List<int> qrData = [];

    qrData.addAll(encodeTLV(1, sellerName));
    qrData.addAll(encodeTLV(2, vatNumber));
    qrData.addAll(encodeTLV(3, invoiceDate));
    qrData.addAll(encodeTLV(4, invoiceTotal));
    qrData.addAll(encodeTLV(5, vatAmount));

    return base64Encode(qrData);
  }

  List<int> encodeTLV(int tag, String value) {
    List<int> tlv = [];
    tlv.add(tag);
    tlv.add(value.length);
    tlv.addAll(utf8.encode(value));
    return tlv;
  }
}
