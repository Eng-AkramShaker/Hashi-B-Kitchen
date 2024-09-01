import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String text;
  final Function() onPressed;

  const OptionItem({super.key, required this.isSelected, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.primaryContainer, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          disabledForegroundColor: Colors.grey.withOpacity(0.38),
          disabledBackgroundColor: Colors.grey.withOpacity(0.12),
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
          // side: BorderSide(color: Theme.of(context).primaryColor, width: .01), // Color when the button is disabled
        ).copyWith(
          overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor.withOpacity(0.1)), // Slightly transparent overlay
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Ensure the button size fits its content
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.black,
              semanticLabel: text, // Accessibility improvement
            ),
            const SizedBox(height: 3),
            Text(
              text,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ],
        ));
  }
}
