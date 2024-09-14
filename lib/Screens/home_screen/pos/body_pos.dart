// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable, unused_element, camel_case_types, sized_box_for_whitespace, unused_local_variable, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:face_auth_flutter/Screens/home_screen/widgets/menu_Item.dart';
import 'package:face_auth_flutter/Screens/home_screen/widgets/option_Item.dart';
import 'package:face_auth_flutter/Screens/orders/orders_screen.dart';
import 'package:face_auth_flutter/Screens/start_shift/start_shift.dart';
import 'package:face_auth_flutter/core/constants/navigators.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_open_shift.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/hive_upload_All_invoices.dart';
import 'package:face_auth_flutter/data/off_Line_DB/hive_providers/user/hive_user.dart';
import 'package:face_auth_flutter/data/provider/kitchen/kitchen_provider.dart';
import 'package:face_auth_flutter/data/provider/upload_All_invoices/upload_All_invoices.dart';
import 'package:face_auth_flutter/data/services/shift/start_shift_api.dart';
import 'package:face_auth_flutter/data/provider/shift_provider/shift.dart';
import 'package:face_auth_flutter/data/provider/auth/Login.dart';
import 'package:face_auth_flutter/data/provider/categories_provider/categories.dart';
import 'package:face_auth_flutter/data/provider/invoice_provider/invoice.dart';
import 'package:face_auth_flutter/data/provider/cost_sharing_provider/cost_sharing.dart';
import 'package:face_auth_flutter/data/provider/orders_provider/orders.dart';
import 'package:face_auth_flutter/data/provider/printer_provider/printer_provider.dart';
import 'package:face_auth_flutter/screens/cost_sharing/cost_sharing.dart';
import 'package:face_auth_flutter/screens/total_screen/total_screen.dart';
import 'package:face_auth_flutter/widgets/cards/empty.dart';
import 'package:face_auth_flutter/widgets/show_snack/select_menu.dart';
import 'package:face_auth_flutter/widgets/text_filed/text_filed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/category_button.dart';
import '../widgets/menu_products.dart';

class Pos_Screen extends StatefulWidget {
  const Pos_Screen({Key? key}) : super(key: key);

  @override
  State<Pos_Screen> createState() => _Pos_ScreenState();
}

class _Pos_ScreenState extends State<Pos_Screen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    intS();
  }

  Future<void> intS() async {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    final proInvoice = Provider.of<Invoice_Provider>(context, listen: false);
    final provLogin = Provider.of<Login_Provider>(context, listen: false);
    final provShift = Provider.of<Shift_Provider>(context, listen: false);
    final provOrders = Provider.of<Orders_Provider>(context, listen: false);

    final userHive = Provider.of<Hive_User_Provider>(context, listen: false);
    final openShiftHive = Provider.of<Hive_Open_Shift_Provider>(context, listen: false);

    final uploadAllInvoicesHive = Provider.of<Hive_Upload_All_invoices>(context, listen: false);
    final proUploadApi = Provider.of<Upload_All_invoices_Provider>(context, listen: false);

    final proKitchen = Provider.of<Kitchen_Provider>(context, listen: false);

    setState(() {
      provCategory.Name_controlle.text = 'Default Customer';
    });

    try {
      proKitchen.fetch_draft_Kitchen(context);
      proKitchen.fetch_Submit_Kitchen(context);

      await provCategory.fetch_group_product(context);
      await provCategory.fetch_Details_Customers(context);
      await proInvoice.Fetch_Order_Options_Method(context);
      await proInvoice.Fetch_Payment_Method(context);

      proInvoice.Fetch_Serial_Number(context);
      provShift.get_Best_Seller(context);
      provOrders.Fetch_Order_invoice(context);

      get_Search(provCategory);

      if (proInvoice.List_Type_Payment != null) {
        for (var i = 0; i < proInvoice.List_Type_Payment!.message.length; i++) {
          if (proInvoice.List_Type_Payment!.message[i].name != 'Cash') {
            proInvoice.List_Type_Payment_2.add(proInvoice.List_Type_Payment!.message[i]);
          }
        }
      }

      await proUploadApi.Upload_All_Invoices_To_Api(context, hive_Upload_All: uploadAllInvoicesHive);

      if (openShiftHive.data == false) {
        await Snack_Select_Menu(
          context: context,
          widget: SizedBox(
            width: 30.w,
            child: Start_Shift(),
          ),
          onPressed: () async {
            await Fund_amount_Api()
                .Post_Api_Start_Shift(context, proInvoice.text_controlle_Starting_Fund_mount.text, provLogin.user!.name.toString());
            setState(() {
              proInvoice.text_controlle_Starting_Fund_mount.text = '00.0';
            });
          },
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _onOptionSelected(int index) {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);
    setState(() {
      provCategory.index_Delivery = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final proPrinter = Provider.of<Printer_Provider>(context, listen: false);

    return Consumer6<Categories_Provider, Invoice_Provider, Login_Provider, Shift_Provider, Cost_Sharing_Provider, Orders_Provider>(
      builder: (context, provCategory, proInvoice, provLogin, provSharing, proCostSharing, provOrders, child) {
        return Column(
          children: [
            build_Total_Invoice(provLogin, provCategory, proInvoice, provOrders, proCostSharing, proPrinter),
            build_Categories(provCategory, proPrinter, size),
          ],
        );
      },
    );
  }

  void get_Search(Categories_Provider provCategory) {
    provCategory.items_Search = [];
  }

  //

  Widget build_Row_Dellivery(Categories_Provider provCategory) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionItem(
          isSelected: provCategory.index_Delivery == 0,
          icon: Icons.store,
          text: 'Dine In',
          onPressed: () {
            setState(() {
              provCategory.index_Delivery = 0;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: OptionItem(
            isSelected: provCategory.index_Delivery == 1,
            icon: Icons.directions_walk,
            text: 'Pick Up',
            onPressed: () {
              setState(() {
                provCategory.index_Delivery = 1;
              });
            },
          ),
        ),
        OptionItem(
          isSelected: provCategory.index_Delivery == 2,
          icon: Icons.local_shipping,
          text: 'Delivery',
          onPressed: () {
            setState(() {
              provCategory.index_Delivery = 2;
            });
          },
        ),
      ],
    );
  }

  //

  Widget build_Categories(Categories_Provider provCategory, Printer_Provider pro_Printer, Size size) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container_Empty(
              h: size.height,
              w: size.width,
              color: Theme.of(context).colorScheme.onBackground,
              Padding: 2,
              border: true,
              child: const Total_Screen(),
            ),
          ),

          // =============================================================================================

          const SizedBox(width: 10),

          Expanded(
            flex: 2,
            child: Container_Empty(
              Padding: 2,
              border: true,
              color: Theme.of(context).colorScheme.onBackground,
              child: provCategory.isLoading == false
                  ? Center(
                      child: Container(
                          width: 25, height: 25, child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary)))
                  : Column(
                      children: [
                        SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: provCategory.Items_group_product?.message.length ?? 0,
                              itemBuilder: (context, index) {
                                final item = provCategory.Items_group_product?.message[index];
                                final imgUrl = item?.groupImage ?? '';

                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: CategoryButton(
                                    title: item?.itemGroup.toString() ?? 'Unknown',
                                    img: imgUrl.isNotEmpty ? imgUrl : 'https://saudi-innovation.com/files/fast-food_737967.png',
                                    isSelected: provCategory.selectedCategory == index,
                                    onTap: () {
                                      setState(() {
                                        provCategory.selectedCategory = index;
                                      });
                                    },
                                  ),
                                );
                              },
                            )),
                        SizedBox(height: 3.h),
                        Menu_Products(
                          context: context,
                          provCategory: provCategory,
                          items: provCategory.Items_group_product!.message[provCategory.selectedCategory].items,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget build_Total_Invoice(Login_Provider provLogin, Categories_Provider provCategory, Invoice_Provider proInvoice,
      Orders_Provider prov_Orders, Cost_Sharing_Provider proCostSharing, Printer_Provider pro_Printer) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          build_Row_Dellivery(provCategory),

          // ---------------------------------------------------------------------------

          const SizedBox(width: 50),
          // MenuItem(icon: Icons.receipt, text: 'Orders', onPressed: () {}),
          MenuItem(
            icon: Icons.refresh,
            text: 'Refresh',
            onPressed: () {
              Reset_Invoice(provCategory, proInvoice, proCostSharing);
            },
          ),

          // Orders ---------------------------------------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: MenuItem(
                icon: Icons.receipt,
                text: 'Orders',
                onPressed: () async {
                  await prov_Orders.Fetch_Order_invoice(context);

                  Snack_Select_Menu(
                    context: context,
                    widget: SizedBox(
                      height: 600,
                      width: 500,
                      child: Column(
                        children: [
                          prov_Orders.is_Loading == true
                              ? Center(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
                                  ),
                                )
                              : const OrdersScreen(),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      pop(context);
                    },
                  );
                }),
          ),

          // Note ----------------------------------------------------------------------------

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: MenuItem(
                icon: Icons.note,
                text: 'Note',
                onPressed: () {
                  Snack_Select_Menu(
                      context: context,
                      backgColor: Theme.of(context).colorScheme.primaryContainer,
                      widget: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Custom_Text_Field(
                          width: 400,
                          height: 200,
                          hint_text: 'Note ...... ',
                          Text_size: 12.sp,
                          TEXT_controller: provCategory.text_Note,
                          color: Colors.black,
                          minLines: 18,
                        ),
                      ),
                      onPressed: () async {
                        //
                        setState(() {
                          //
                        });

                        pop(context);
                      });
                }),
          ),

          // Split ---------------------------------------------------------------------------

          MenuItem(
              icon: Icons.content_cut,
              text: 'Split',
              onPressed: () {
                //

                pushNewScreen(context, const Cost_Sharing());
              }),

          //
        ],
      ),
    );
  }

  //

  Reset_Invoice(Categories_Provider provCategory, Invoice_Provider pro_Invoice, Cost_Sharing_Provider proCostSharing) async {
    setState(() {
      pro_Invoice.Remaining_price = 0.0;
      pro_Invoice.pay = 0;

      pro_Invoice.main_List_Invoice = [];
      pro_Invoice.change_List_Invoice = [];

      provCategory.index_Delivery = 0;
      pro_Invoice.Cal_total = 0.0;
      pro_Invoice.Sub_total = 0;
      provCategory.text_Note.text = 'Note ....';

      proCostSharing.List_page_2 = [];
      proCostSharing.List_page_3 = [];
      proCostSharing.List_Print = [];
    });
    await provCategory.fetch_Details_Customers(context);
  }
}
