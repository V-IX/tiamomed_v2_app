import 'package:flutter/material.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key, required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Услуга'), centerTitle: true),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 150, left: 22, right: 22),
        child: FilledButton(
            onPressed: () {},
            child: const Text('Записаться')
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(children: [Text('Здесь будет описание услуги $serviceId')]),
        ),
      ),
    );
  }
}
