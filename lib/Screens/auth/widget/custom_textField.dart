import 'package:face_auth_flutter/core/constants/constants.dart';
import 'package:face_auth_flutter/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({
    super.key,
    required this.size,
    required this.icon,
    required this.onChanged,
    required this.title,
    required this.hintText,
  });

  final Size size;
  final IconData icon;
  final void Function(String) onChanged;
  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 8.w, child: Custom_Text(text: "$title :  ", size: 12.sp, fontweight: FontWeight.bold, color: Colors.black)),
        SizedBox(
          width: size.width / 3.8,
          child: TextField(
            style: const TextStyle(color: bgColor, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.emailAddress,
            cursorColor: bgColor,
            obscureText: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: bgColor),
              ),
              fillColor: const Color.fromARGB(113, 216, 170, 70),
              hintText: hintText,
              hintStyle: const TextStyle(color: Color.fromARGB(255, 131, 125, 125)),
              filled: true,
              prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: bgColor),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
