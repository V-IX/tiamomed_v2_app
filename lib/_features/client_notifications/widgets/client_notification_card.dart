import 'package:flutter/material.dart';

import '../models/client_notification.dart';

class ClientNotificationCard extends StatefulWidget {
  const ClientNotificationCard({super.key, required this.notification});

  final ClientNotification notification;

  @override
  State<ClientNotificationCard> createState() => _ClientNotificationCardState();
}

class _ClientNotificationCardState extends State<ClientNotificationCard> {

  @override
  void initState() {
    print('------ init');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          if(!widget.notification.isRead)
            Icon(Icons.circle, color: Colors.red, size: 10),
          Text(widget.notification.createdAt),
          Text(widget.notification.title),
          Text(widget.notification.message),
        ],
      ),
    );
  }
}
