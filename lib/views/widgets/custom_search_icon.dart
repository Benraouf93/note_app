import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 50,
      height : 50,
      decoration : BoxDecoration(
        color : const Color.fromRGBO(255, 255, 255, 0.07),
        borderRadius : BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(Icons.search, size: 28),
      ),
    );
  }
}