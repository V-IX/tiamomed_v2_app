import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title = ''});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      title: Column(children: <Widget>[FittedBox(child: Text(title))]),
      shadowColor: Colors.black26,
      centerTitle: true,
      surfaceTintColor: Colors.white,
      elevation: 10,
    );
  }
}
