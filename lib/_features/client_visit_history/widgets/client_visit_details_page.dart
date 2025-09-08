import 'package:flutter/material.dart';

import '../../../_shared/widgets/navigation/custom_app_bar.dart';

class ClientVisitDetailsPage extends StatelessWidget {
  const ClientVisitDetailsPage({super.key, required this.clientVisitId});

  final String clientVisitId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '#$clientVisitId'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(children: [Text('Здесь будет описание услуги')]),
        ),
      ),
    );
  }
}
