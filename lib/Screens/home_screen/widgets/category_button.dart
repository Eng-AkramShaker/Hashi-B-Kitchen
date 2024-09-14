import 'package:face_auth_flutter/Screens/home_screen/widgets/img_network.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/constants/constants.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final String img;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({required this.title, required this.img, required this.isSelected, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 130,
        decoration: BoxDecoration(
          color: isSelected ? w_green_Color : wtColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            custom_img_Network(img, h: 40, w: 40),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
