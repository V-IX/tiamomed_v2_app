import "package:flutter/material.dart";

Future<void> basicAlertDialog({
  required BuildContext context,
  required String title,
  required String desc
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext _) {
      return AlertDialog(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(title, style: const TextStyle(color: Color(0xFFFF0066))),
        content: Text(desc),
        actions: <Widget>[
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF0066)),
            onPressed: ()  => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text("Закрыть", style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}
