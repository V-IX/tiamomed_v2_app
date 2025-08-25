import 'package:flutter/material.dart';

class ClientFeedbackPage extends StatefulWidget {
  const ClientFeedbackPage({super.key});

  @override
  State<ClientFeedbackPage> createState() => _ClientFeedbackPageState();
}

class _ClientFeedbackPageState extends State<ClientFeedbackPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Отзывы')),
        body: const Center(
          child: Text('Отзывы'),
        )
    );
  }

}
