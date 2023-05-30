import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Row(
        children: [
          const Text(
            'Hello',
            style: TextStyle(fontSize: 25),
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
              onPressed: () {},
              icon: const Icon(Icons.search, size: 25),
            ),
          ),
        ],
      );
  }
}
