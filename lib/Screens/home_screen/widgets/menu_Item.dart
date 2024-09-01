import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;

  const MenuItem({super.key, required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // side: BorderSide(color: Theme.of(context).primaryColor, width: .01), // Using theme color
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
          const SizedBox(height: 5.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
    );
  }
}
