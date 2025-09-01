import 'package:flutter/material.dart';

import 'service_details_price_card.dart';

class ServiceDetailsPriceList extends StatelessWidget {
  const ServiceDetailsPriceList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int index) {
        return const ServiceDetailsPriceCard();
      },
      separatorBuilder: (_,_) {
        return const SizedBox(height: 12);
      },
      itemCount: 4,
    );
  }
}
