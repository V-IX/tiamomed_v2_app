import 'package:flutter/material.dart';

class ClientFilesPage extends StatelessWidget {
  const ClientFilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Файлы')),
      body: const Center(
        child: Text('Файлы'),
      )
    );
  }
}
