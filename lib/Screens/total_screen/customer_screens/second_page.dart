import 'package:face_auth_flutter/Screens/home_screen/widgets/customer_search.dart';
import 'package:flutter/material.dart';

class SecondPage_Customer extends StatelessWidget {
  const SecondPage_Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Search_Customer(),
      ),
    );
  }
}
