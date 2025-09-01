import 'package:flutter/material.dart';

import 'service_details_price_list.dart';

const String testDesc = 'Процедура проводится с помощью препарата на основе ботулотоксина – Релатокс или Диспорт. Ботулотоксин блокирует передачу нервных импульсов мышечным волокнам, тем самым они расслабляются и уже больше не сокращаются. После окончания процедуры кожа над мышцами становится ровной и, как следствие, морщины разглаживаются. Первые процедуры коррекции морщин препаратами на основе ботулотоксина более краткосрочны (эффект длится около 3-6 месяцев), затем мышцы привыкают находиться в расслабленном состоянии.';


class ServiceDetailsContent extends StatelessWidget {
  const ServiceDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Название услуги'),
            const SizedBox(height: 22),
            const Text(testDesc),
            const SizedBox(height: 22),
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network('https://thanhtrucmed.com/wp-content/uploads/2024/07/lam-dep-da-bang-cong-nghe-cao.jpg')
            ),
            const SizedBox(height: 22),
            const Text('Смотреть цены*'),
            const Text('*Цены указаны с учетом скидки при условии оплаты наличным или дебетовыми картами. Скидка на карты рассрочки не распространяется.'),
            const SizedBox(height: 22),
            const Text('Для просмотра подробной информации нажмите на соответствующую строку'),
            const SizedBox(height: 22),
            const ServiceDetailsPriceList(),
            const SizedBox(height:84),

          ]
        )
      )
    );
  }
}
