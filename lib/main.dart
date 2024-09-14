// ignore_for_file: unused_import

import 'package:face_auth_flutter/Screens/auth/SplashScrren.dart';
import 'package:face_auth_flutter/core/constants/path_provider.dart';
import 'package:face_auth_flutter/core/theme/theme_provider.dart';
import 'package:face_auth_flutter/data/off_Line_DB/initialized_Hive/int_Hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Int_Hive();
  // cameras = await availableCameras();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(), child: MultiProvider(providers: providers, child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        home: const SplashScreen(),
        // home: const HomeScreen(),
      );
    });
  }
}



//  ElevatedButton(
// onPressed: ()async {
//       _futureData = Api().fetchData(context);
//       print(provCategory.model_items[0][0].name);
//       print(provCategory.model_group[0]);
//      },
//     child: const Text('data'),
// ),


//   Administrator

//  JT8r!HKmJX9D
