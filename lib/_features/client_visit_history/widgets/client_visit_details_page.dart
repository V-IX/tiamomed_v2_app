import 'package:flutter/material.dart';

class ClientVisitDetailsPage extends StatelessWidget {
  const ClientVisitDetailsPage({super.key, required this.clientVisitId});

  final String clientVisitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('#$clientVisitId')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(children: [Text('Здесь будет описание услуги')]),
        ),
      ),
    );
  }
}
