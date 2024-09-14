// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, avoid_print, prefer_const_constructors

import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/Screens/closing_shift/top_seller.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/dropdown_my_account.dart';
import 'package:face_auth_flutter/core/constants/check_interner.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/core/theme/theme_provider.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

AppBar Custom_App_Bar(context, TabController? _tabController, List<String> tabs, Shift_Provider prov_shift) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onBackground,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Image.asset('assets/images/logo.png', width: 200, height: 180),
        ),
        SizedBox(
          height: 50,
          width: 250,
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            labelColor: Theme.of(context).colorScheme.surface,
            unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
            dividerColor: Colors.white,
            tabs: tabs
                .map((tabText) => SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          tabText,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        Row(
          children: [
            check_internet(),
            const SizedBox(width: 100),
            Custom_Button(
              context: context,
              title: "Lock screen",
              size_icon: 30,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              horizontal: 15,
              vertical: 10,
              onPressed: () async {
                //

                pushAndRemoveUntil(context, const Login_OTP_Screen());
              },
            ),
            const SizedBox(width: 100),
            // IconButton(
            //   icon: const Icon(color: Colors.black, Icons.fullscreen),
            //   onPressed: () {},
            // ),
            IconButton(
              icon: Icon(color: Theme.of(context).colorScheme.onSecondary, Icons.brightness_2),
              onPressed: () {
                //

                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
            ),
            // IconButton(
            //   icon: const Icon(color: Colors.black, Icons.language),
            //   onPressed: () {},
            // ),
            const SizedBox(width: 50),
            SizedBox(
              height: 50,
              child: Card(
                color: Theme.of(context).colorScheme.surface,
                child: IconButton(
                  icon: const Icon(color: Colors.red, size: 25, Icons.exit_to_app),
                  onPressed: () async {
                    await prov_shift.get_Best_Seller(context);

                    pushNewScreen(context, const Top_Seller_Screen());
                  },
                ),
              ),
            ),
            const SizedBox(width: 30),
            const Dropdown_My_Account(),
          ],
        ),
      ],
    ),
  );
}
