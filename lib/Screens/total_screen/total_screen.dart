// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, use_build_context_synchronously, unused_import, unnecessary_null_comparison, prefer_is_empty, must_be_immutable, await_only_futures

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:face_auth_flutter/Screens/auth/login_otp_screen.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/customer_search.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/customer_screens/first_page.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/customer_screens/second_page.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/select_table.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/tab_bar_view.dart';
import 'package:face_auth_flutter/Screens/total_screen/widget/title_subTitle.dart';
import 'package:face_auth_flutter/data/services/api.dart';
import 'package:face_auth_flutter/main.dart';
import 'package:face_auth_flutter/provider/auth/Login.dart';
import 'package:face_auth_flutter/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/screens/total_screen/total_screen.dart';
import 'package:face_auth_flutter/widgets/Buttons/custom_2_button.dart';
import 'package:face_auth_flutter/widgets/Radio_Button/Custom_Select_button.dart';
import 'package:face_auth_flutter/widgets/divider/divider.dart';
import 'package:face_auth_flutter/widgets/dropdown_button/choose_order_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/constants.dart';
import '../../core/constants/navigators.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/cards/empty.dart';
import '../../widgets/dropdown_button/payment.dart';
import '../../widgets/dropdown_button/return_invoice.dart';
import '../../widgets/rows/row_choose_category.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import '../../widgets/show_snack/select_menu.dart';
import '../../widgets/show_snack/snak_total.dart';
import '../../widgets/text_filed/text_filed.dart';
import '../../widgets/texts/custom_text.dart';
import '../cost_sharing/cost_sharing.dart';

class Total_Screen extends StatefulWidget {
  const Total_Screen({super.key});

  @override
  State<Total_Screen> createState() => _Total_ScreenState();
}

class _Total_ScreenState extends State<Total_Screen> {
  int _selectedIndex = 0;

  _onOptionSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer3<Categories_Provider, Invoice_Provider, Login_Provider>(
      builder: (context, provCategory, pro_Invoice, prov_Login, child) {
        return Container(
          height: size.height,
          width: size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ListView =============================================================
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Flexible(
                      flex: 0,
                      child: Container_Empty(
                        h: 30,
                        Padding: 5,
                        color: Theme.of(context).colorScheme.surface,
                        circular: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                //

                                Snack_Select_Menu(
                                  context: context,
                                  backgColor: Theme.of(context).colorScheme.onBackground,
                                  widget: const SizedBox(height: 500, width: 600, child: Select_Tablet()),
                                  onPressed: () async {
                                    pop(context);
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text('Select Table'),
                                  SizedBox(width: 4),
                                  Icon(Icons.edit_square, size: 15, color: primaryColor),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //

                                Snack_Select_Menu(
                                    context: context,
                                    backgColor: Theme.of(context).colorScheme.onBackground,
                                    widget: TabBarView_Customer(),
                                    onPressed: () async {
                                      //

                                      pop(context);

                                      await provCategory.Send_Customer_Create(
                                        context: context,
                                        customer_name: provCategory.Name_controlle.text,
                                        commercial_registration: provCategory.Commercial_Register_controlle.text,
                                        tax_id: provCategory.Tax_Number_controlle.text,
                                        address_title: '',
                                        address_line1: '',
                                        address_in_arabic: provCategory.Detailed_Address_controlle.text,
                                        address_line2: '',
                                        city: provCategory.City_controlle.text,
                                        state: provCategory.City_controlle.text,
                                        country: provCategory.Country_controlle.text,
                                        pincode: '',
                                        fax: '',
                                        email: '',
                                        phone: '',
                                        customer_type: provCategory.Type_controlle.text,
                                      );

                                      setState(() {
                                        provCategory.Name_controlle.text = 'Default Customer';
                                        provCategory.Type_controlle.text = 'Default Customer';

                                        provCategory.Tax_Number_controlle.text = '';
                                        provCategory.Commercial_Register_controlle.text = '';
                                        provCategory.Country_controlle.text = '';
                                        provCategory.City_controlle.text = '';
                                        provCategory.Detailed_Address_controlle.text = '';
                                      });
                                    });
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.person_outline, size: 20),
                                  Text('Default Customer'),
                                  SizedBox(width: 4),
                                  Icon(Icons.edit_square, size: 15),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        // height: size.height / 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: pro_Invoice.change_List_Invoice.length,
                          itemBuilder: (BuildContext context, int index) {
                            final category = pro_Invoice.change_List_Invoice[index];
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Row_Choose_Category(
                                context: context,
                                isSelected: _selectedIndex == index,
                                name: category.change_itemCode,
                                price: category.change_price,
                                count: category.change_qty.toString(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // add  /  minus  ======================================================

              Flexible(
                flex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    //
                    Container_Empty(
                      Padding: 0,
                      color: Theme.of(context).colorScheme.surface,
                      circular: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            //  add ---------------------------------------------------------------

                            custom_2_Button(
                              icon: Icons.add,
                              onPressed: () async {
                                //
                                final main = await pro_Invoice.main_List_Invoice[_selectedIndex]; // Static
                                final change = await pro_Invoice.change_List_Invoice[_selectedIndex];

                                _onOptionSelected(_selectedIndex);

                                setState(() {
                                  pro_Invoice.change_List_Invoice[_selectedIndex].change_qty = (change.change_qty + 1);

                                  change.change_price = (double.parse(change.change_price) + double.parse(main.price)).toString();
                                });

                                await pro_Invoice.cal_Total();
                              },
                            ),

                            //  minus -------------------------------------

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: custom_2_Button(
                                icon: Icons.remove,
                                onPressed: () async {
                                  //
                                  final main = await pro_Invoice.main_List_Invoice[_selectedIndex]; // Static
                                  final change = await pro_Invoice.change_List_Invoice[_selectedIndex];

                                  if (change.change_qty > 1) {
                                    _onOptionSelected(_selectedIndex);

                                    setState(() {
                                      pro_Invoice.change_List_Invoice[_selectedIndex].change_qty = (change.change_qty - 1);

                                      change.change_price = (double.parse(change.change_price) - double.parse(main.price)).toString();
                                    });

                                    await pro_Invoice.cal_Total();
                                  }
                                },
                              ),
                            ),

                            // remove  -------------------------------------

                            custom_2_Button(
                              icon: Icons.delete,
                              color_icon: redColor,
                              onPressed: () async {
                                //

                                await pro_Invoice.remove_Item(index: _selectedIndex);

                                setState(() {
                                  pro_Invoice.Remaining_price = 0;
                                  pro_Invoice.pay = 0;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //   Total =================================================================================

                    Container_Empty(
                      Padding: 2,
                      color: Theme.of(context).colorScheme.surface,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // CustomTable()

                          Table(
                            // border: TableBorder.all(width: .3),
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Card(
                                      color: Theme.of(context).colorScheme.background,
                                      child: Container(
                                          height: 63,
                                          child: Title_SubTitle(title: 'Sub Total', text: pro_Invoice.Sub_total.toString())),
                                    ),
                                  ),
                                  TableCell(
                                    child: InkWell(
                                      onTap: () {
                                        //
                                      },
                                      child: Card(
                                        color: Theme.of(context).colorScheme.background,
                                        child: Container(
                                            height: 63, child: Title_SubTitle(title: 'Discount', text: '15 % ', showButton: true)),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Card(
                                        color: Theme.of(context).colorScheme.background,
                                        child: Container(
                                            height: 63, child: Title_SubTitle(title: 'Charge', text: ' 0 %', showButton: true))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: InkWell(
                                      onTap: () {
                                        //
                                      },
                                      child: Card(
                                        color: Theme.of(context).colorScheme.background,
                                        child: Container(
                                          height: 60,
                                          child: Title_SubTitle(title: 'Tax', text: ' 15 % ', showButton: true),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Card(
                                      color: Theme.of(context).colorScheme.background,
                                      child: Container(
                                        height: 60,
                                        child: Title_SubTitle(title: 'Total', text: pro_Invoice.Cal_total.toStringAsFixed(2)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
