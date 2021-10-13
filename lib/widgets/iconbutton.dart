import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final ImageIcon icon;
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ButtonIcon({
    this.icon,
    this.text,
    this.onPressed,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(340, 50),
        primary: color,
      ),
    );
  }
}
