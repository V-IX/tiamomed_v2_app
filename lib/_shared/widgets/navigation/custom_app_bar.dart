import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title = ''});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      title: Column(children: <Widget>[FittedBox(child: Text(title))]),
      shadowColor: Colors.black26,
      surfaceTintColor: Colors.white,
      elevation: 10,
      backgroundColor: Colors.white,
      titleSpacing: 0,
      leadingWidth: 44,
      leading: Padding(
        padding: const EdgeInsets.only(left: 28),
        child: IconButton(
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            alignment: Alignment.center,
            minimumSize: WidgetStatePropertyAll(Size(22,22)),
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.primary, size: 14),
        ),
      ),
    );
  }
}
