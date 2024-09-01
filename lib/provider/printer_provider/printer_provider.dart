// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_conditional_assignment, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_star_prnt/flutter_star_prnt.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:ui' as ui;

class Printer_Provider with ChangeNotifier {
  //

  TextEditingController iP_Address_Print = TextEditingController();
  Uint8List? capturedImageBytes;

  // add Padding ==========================================================================================

  Future<Uint8List> _addPaddingToImage(Uint8List originalBytes, double paddingHeight) async {
    // تحويل Uint8List إلى صورة
    final codec = await ui.instantiateImageCodec(originalBytes);
    final frame = await codec.getNextFrame();
    final originalImage = frame.image;

    final originalWidth = originalImage.width;
    final originalHeight = originalImage.height;

    final newHeight = originalHeight + paddingHeight.toInt();

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    canvas.drawImage(originalImage, Offset(0, 0), paint);

    canvas.drawRect(
      Rect.fromLTWH(0, originalHeight.toDouble(), originalWidth.toDouble(), paddingHeight),
      Paint()..color = Colors.white,
    );

    final newImage = await recorder.endRecording().toImage(originalWidth, newHeight);

    final byteData = await newImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  // StarGraphic ==========================================================================================

  String emulationFor(String modelName) {
    String emulation = 'StarGraphic';
    if (modelName.isNotEmpty) {
      final em = StarMicronicsUtilities.detectEmulation(modelName: modelName);
      if (em != null && em.emulation != null) {
        emulation = em.emulation!;
      }
    }
    return emulation;
  }

// capture Png  -------------------------------------------------------------------------------------------------------

  Future<Uint8List> capture_Png(GlobalKey globalKey) async {
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    double contentHeight = boundary.size.height;
    double contentWidth = boundary.size.width;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print("Captured Image Size: ${pngBytes.lengthInBytes} bytes");

    capturedImageBytes = pngBytes;

    notifyListeners();
    return pngBytes;
  }

  // image Print ==========================================================================================

  Future img_Print(Uint8List bytes, String ip_Address) async {
    if (ip_Address == "") {
      return;
    }
    try {
      //
      String emulation = emulationFor("StarModel");
      PrintCommands commands = PrintCommands();

      Uint8List paddedBytes = await _addPaddingToImage(bytes, 100.0);

      await commands.appendBitmapByte(
          byteData: paddedBytes, diffusion: true, bothScale: true, alignment: StarAlignmentPosition.Center);

      // Cut ---------

      await commands.appendCutPaper(StarCutPaperAction.FullCut);

      print(await StarPrnt.sendCommands(portName: "TCP:$ip_Address", emulation: emulation, printCommands: commands));
    } catch (e) {
      print("فشل الطباعه");
    }
  }

  //  Print By IP  ==================================================================================================

  Print_By_IP(GlobalKey _globalKey, String ip_Address) async {
    Uint8List bytes_2 = await capture_Png(_globalKey);

    print(bytes_2);

    await img_Print(bytes_2, ip_Address);
  }

  //
}
