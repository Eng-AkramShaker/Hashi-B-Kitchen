// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names, prefer_typing_uninitialized_variables, unnecessary_null_comparison, await_only_futures, unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_conditional_assignment, unused_local_variable

import 'package:face_auth_flutter/data/models/print_dataBase_model.dart';
import 'package:face_auth_flutter/data/services/print_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_star_prnt/flutter_star_prnt.dart';
import 'package:flutter/services.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

class Printer_Provider with ChangeNotifier {
  //

  Uint8List? capturedImageBytes;

  //

  TextEditingController iP_Address_Print = TextEditingController();

  GetPrintDataBaseModel? Show_IP_Address;
// create
  TextEditingController Name_IPAddress = TextEditingController();
  TextEditingController IPAddress = TextEditingController();

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

// capture Png  ------------------------------------------------------------------------------------------

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

  //  Print Model_Star  ===================================================================================

  Print_Model_Star(GlobalKey _globalKey, String ip_Address) async {
    Uint8List bytes_2 = await capture_Png(_globalKey);

    print(bytes_2);

    await img_Print(bytes_2, ip_Address);
  }

  //  Print Model_EPSON  ==================================================================================

  print_Model_EPSON(GlobalKey _globalKey, String ipController) async {
    if (ipController == "") {
      return;
    }
    try {
      Uint8List uint8Bytes = await capture_Png(_globalKey);

      final profile = await CapabilityProfile.load();
      final printer = NetworkPrinter(PaperSize.mm80, profile);

      final printerConnect = await printer.connect(ipController, port: 9100);
      if (printerConnect == PosPrintResult.success) {
        final img.Image? image = img.decodeImage(uint8Bytes);
        if (image != null) {
          final resizedImage = img.copyResize(image, width: 600);
          printer.image(resizedImage);
        }
        printer.cut();
        printer.disconnect();
      } else {
        print('Could not connect to printer');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  //

  // Create_Print_DataBase Api  ===========================================================================

  Create_Print_DataBase({required context, required String print_name, required String print_ip}) async {
    await Print_Api().create_ipAddress_Api(context, print_name, print_ip);
  }

  // Get_Print_DataBase Api  ==============================================================================

  get_Print_DataBase() async {
    Show_IP_Address = null;
    Show_IP_Address = await Print_Api().fetch_All_ipAddress_Api();

    print(Show_IP_Address);
  }
}
