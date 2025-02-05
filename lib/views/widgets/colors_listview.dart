import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelect});
  final Color color;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return isSelect
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: CircleAvatar(
              radius: 22,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: color,
          );
  }
}

class ListColorItem extends StatefulWidget {
  const ListColorItem({super.key});

  @override
  State<ListColorItem> createState() => _ListColorItemState();
}

class _ListColorItemState extends State<ListColorItem> {
  int currentIndex = 0;
  List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25 * 2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                color: colors[index],
                isSelect: index == currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
