import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_star_prnt/flutter_star_prnt.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class test extends StatefulWidget {
  const test({super.key});

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final GlobalKey _globalKey = GlobalKey();
  bool isLoading = false;
  TextEditingController ip = TextEditingController();

  Future<Uint8List> _capturePng() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));

      RenderRepaintBoundary? boundary = _globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        print("Boundary is null");
        return Uint8List(0);
      }

      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) {
        print("Failed to convert image to byte data");
        return Uint8List(0);
      }

      return byteData.buffer.asUint8List();
    } catch (e) {
      print("Error capturing PNG: $e");
      return Uint8List(0);
    }
  }

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

  Future<Uint8List> _loadNetworkImage(String url) async {
    final ByteData data = await NetworkAssetBundle(Uri.parse(url)).load("");
    return data.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Star Printer Example App')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: ip,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'IP',
                ),
              ),
              const SizedBox(height: 50),
              isLoading ? const CircularProgressIndicator() : Container(),
              TextButton(
                onPressed: () async {
                  if (ip.text.isEmpty) {
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  String emulation = emulationFor("StarModel");

                  PrintCommands commands = PrintCommands();

                  String raster = "        Star Clothing Boutique\n"
                      "               السلام عليكم   \n"
                      "           اكرم ابو بكر شاكر          \n"
                      "\n"
                      "SKU            Description       Total\n"
                      "--------------------------------------\n"
                      "SKU            Description       Total\n"
                      "And tags attached\n";
                  commands.appendBitmapText(text: raster);
                  try {
                    final result =
                        await StarPrnt.sendCommands(portName: "TCP:${ip.text}", emulation: emulation, printCommands: commands);
                    print(result);
                  } catch (e) {
                    print("Error sending print commands: $e");
                  }

                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text('Button 1'),
              ),
              TextButton(
                onPressed: () async {
                  if (ip.text.isEmpty) {
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  String emulation = emulationFor("StarModel");
                  PrintCommands printCommands = PrintCommands();

                  // إضافة النص إلى أوامر الطباعة
                  String raster = "        Star Clothing Boutique\n"
                      "               السلام عليكم   \n"
                      "           اكرم ابو بكر شاكر          \n"
                      "\n"
                      "SKU            Description       Total\n"
                      "--------------------------------------\n"
                      "SKU            Description       Total\n"
                      "And tags attached\n";
                  printCommands.appendBitmapText(text: raster);

                  // تحميل وطباعة الصورة الأولى
                  printCommands = img_Print('https://example.com/your-second-image.png');

                  // تحميل وطباعة الصورة الثانية
                  printCommands = img_Print('https://example.com/your-second-image.png');

                  // إرسال الأوامر للطابعة

                  try {
                    final result =
                        await StarPrnt.sendCommands(portName: "TCP:${ip.text}", emulation: emulation, printCommands: printCommands);
                    print(result);
                  } catch (e) {
                    print("Error sending print commands: $e");
                  }

                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text('Button 2'),
              ),
              TextButton(
                onPressed: () async {
                  if (ip.text.isEmpty) {
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  String emulation = emulationFor("StarModel");
                  PrintCommands printCommands = PrintCommands();

                  // إضافة النص إلى أوامر الطباعة
                  String raster = "        Star Clothing Boutique\n"
                      "               السلام عليكم   \n"
                      "           اكرم ابو بكر شاكر          \n"
                      "\n"
                      "SKU            Description       Total\n"
                      "--------------------------------------\n"
                      "SKU            Description       Total\n"
                      "And tags attached\n";
                  printCommands.appendBitmapText(text: raster);

                  // تحميل وطباعة الصورة الأولى
                  try {
                    final imgBytes1 = await _loadNetworkImage('https://arabiclantern.com/wp-content/uploads/2023/04/icon-768x768.png');
                    printCommands.appendBitmapByte(
                        byteData: imgBytes1, diffusion: true, bothScale: true, alignment: StarAlignmentPosition.Center);
                  } catch (e) {
                    print("Error loading first image: $e");
                  }

                  // تحميل وطباعة الصورة الثانية
                  try {
                    final imgBytes2 = await _loadNetworkImage('https://example.com/your-second-image.png');
                    printCommands.appendBitmapByte(
                        byteData: imgBytes2, diffusion: true, bothScale: true, alignment: StarAlignmentPosition.Center);
                  } catch (e) {
                    print("Error loading second image: $e");
                  }

                  // إرسال الأوامر للطابعة
                  try {
                    final result =
                        await StarPrnt.sendCommands(portName: "TCP:${ip.text}", emulation: emulation, printCommands: printCommands);
                    print(result);
                  } catch (e) {
                    print("Error sending print commands: $e");
                  }

                  setState(() {
                    isLoading = false;
                  });
                },
                child: const Text('Button 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  img_Print(String url) async {
    final ByteData data = await NetworkAssetBundle(Uri.parse(url)).load("");
    final imgBytes = data.buffer.asUint8List();

    PrintCommands printCommands = PrintCommands();
    printCommands.appendBitmapByte(
      byteData: imgBytes,
      diffusion: true,
      bothScale: true,
      alignment: StarAlignmentPosition.Center,
    );

    return printCommands;
  }
}
