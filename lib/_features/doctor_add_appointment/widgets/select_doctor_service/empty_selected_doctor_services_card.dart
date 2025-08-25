import 'package:flutter/material.dart';

class EmptySelectedDoctorServicesCard extends StatelessWidget {
  const EmptySelectedDoctorServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 34.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const <BoxShadow>[
          BoxShadow(
            color: Color(0x63D6DBE1),
            blurRadius: 40,
          )
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.warning, color: Theme.of(context).colorScheme.primary),
              const Text(
                'Услуга не выбрана',
                style: TextStyle(
                  color: Color(0xFF282F41),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          const SizedBox(height: 22.0),
          const Text(
            'Для добавления услуги нажмите кнопку «Добавить услугу»',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF282F41),
              fontSize: 13,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
