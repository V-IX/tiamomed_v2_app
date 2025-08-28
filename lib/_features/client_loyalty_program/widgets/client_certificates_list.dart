import 'package:flutter/material.dart';

import '../models/client_certificate.dart';
import 'client_certificate_card.dart';

class ClientCertificatesList extends StatelessWidget {
  const ClientCertificatesList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(22),
      itemBuilder: (BuildContext context, int index){
        return ClientCertificateCard(
          certificate: ClientCertificate.fake(),
        );
      },
      separatorBuilder: (_, int index) {
        return const SizedBox(height: 12);
      },
      itemCount: 10,
    );
  }
}
