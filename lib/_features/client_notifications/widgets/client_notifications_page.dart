import 'package:flutter/material.dart';

class ClientNotificationsPage extends StatelessWidget {
  const ClientNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Здесь будут уведомления'),
      ),
    );
  }
}
