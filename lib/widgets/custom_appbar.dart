import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, required this.text, required this.icon, this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        const Spacer(),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.15),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
        ),
      ],
    );
  }
}
