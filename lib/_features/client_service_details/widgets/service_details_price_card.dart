import 'package:flutter/material.dart';

import 'service_details_price_bottom_sheet.dart';

class ServiceDetailsPriceCard extends StatelessWidget {
  const ServiceDetailsPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          useRootNavigator: true,
          context: context,
          builder: (BuildContext context) {
            return const ServiceDetailsPriceBottomSheet();
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 26),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Text('100 единиц Диспорт (флакон 500 ед) Рассрочка 3 мес'),
            ),
            SizedBox(width: 44),
            Flexible(
              child: Text('420.08 руб.'),
            )
          ],
        )
      ),
    );
  }
}
