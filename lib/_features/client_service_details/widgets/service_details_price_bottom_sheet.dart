import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/all.dart';

class ServiceDetailsPriceBottomSheet extends StatelessWidget {
  const ServiceDetailsPriceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: const Column(
              children: [
                Text('100 единиц Диспорт (флакон 500 ед) Рассрочка 3 мес'),
                SizedBox(height: 22),
                Text('Итого: 420.08 руб.'),
                SizedBox(height: 22),
                MarkdownBlock(data: '### Hello \n- qweqwe\n- qweqwe \n- qweqwe'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
