import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.isSelected,
    required this.onCLick,
    required this.iconPath,
    required this.title,
    required this.index,
  });

  final bool isSelected;
  final VoidCallback onCLick;
  final String iconPath;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: (){
            onCLick();
          },
          icon: SvgPicture.asset(
            iconPath,
            colorFilter: ColorFilter.mode(Color(isSelected ? 0xFFFF0066 : 0xFF4A4A4A), BlendMode.srcIn)
          )
        ),
        const SizedBox(height: 6.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? const Color(0xFFFF0066) : const Color(0xFF4A4A4A),
            fontSize: 10,
            fontWeight: FontWeight.w300,
            height: -1,
          ),
        )
      ],
    );
  }

}
