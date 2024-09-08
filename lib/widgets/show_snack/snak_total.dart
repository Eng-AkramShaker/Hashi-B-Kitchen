// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

// ================================================================================

Snack_Total({required context, textInputType, required Widget widget, required onTap}) {
  prompt(
    context,
    title: Center(
      child: widget,
    ),
    validator: onTap,
    keyboardType: textInputType ?? TextInputType.text,
    // initialValue: initialValue,
    isSelectedInitialValue: false,
    textOK: const Text('تأكيد', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),

    textCancel: const Text('إلغاء', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
    // hintText: 'Please write reason',

    // minLines: 2,
    maxLines: 3,
    // autoFocus: false,
    // obscureText: false,
    // obscuringCharacter: '*',
    // showPasswordIcon: false,
    // barrierDismissible: true,
    // textCapitalization: TextCapitalization.words,
    textAlign: TextAlign.center,
    // controller: Norm_crl.phoneController,
  );
}
