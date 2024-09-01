import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 240, 240, 240),
    onBackground: Color.fromARGB(255, 228, 228, 228),
    primaryContainer: Color.fromARGB(255, 228, 228, 228),
    secondary: Color.fromARGB(255, 182, 233, 184),
    primary: Colors.black, // Text

    surface: Colors.white, // Text

    onSecondary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    onBackground: Colors.grey.shade600,
    primaryContainer: Colors.grey.shade300,
    secondary: const Color.fromARGB(255, 182, 233, 184),
    primary: Colors.black, // Text

    surface: Colors.black, // Text

    onSecondary: Colors.white,

    //
  ),
);

//  Container(
//           color: Theme.of(context).colorScheme.primaryContainer,
//           height: 200,
//           width: 200,
//           child: Text(
//             'data',
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.surface,
//             ),
//           ),
//         ),
