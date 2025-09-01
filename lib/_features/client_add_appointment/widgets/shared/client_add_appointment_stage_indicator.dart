import 'package:flutter/material.dart';

const Color _activeColor = Color(0xFFFF0066);
const Color _completedColor = Color(0xFF282F41);
const Color _inactiveColor = Color(0xFFC3C7CC);


class ClientAddAppointmentStageIndicator extends StatelessWidget {
  const ClientAddAppointmentStageIndicator({ required this.step, this.isShowServices = true, super.key });

  final int step;
  final bool isShowServices;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const <BoxShadow>[
          BoxShadow(color: Color(0x63D6DBE1), blurRadius: 40,),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: const EdgeInsets.only(left: 22, right: 22, top: 20, bottom: 20),
      child: isShowServices ?
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildStep(1, 'Доктор'),
          _buildConnector(),
          _buildStep(2, 'Услуги'),
          _buildConnector(),
          _buildStep(3, 'Дата'),
          _buildConnector(),
          _buildStep(4, 'Итог'),
        ]) :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildStep(1, 'Доктор'),
            _buildConnector(),
            _buildStep(2, 'Дата'),
            _buildConnector(),
            _buildStep(3, 'Итог'),
          ]),
    );
  }

  Widget _buildStep(int stepIndex, String title) {
    Color color;
    if (step == stepIndex) {
      color = _activeColor;
    } else if (step > stepIndex) {
      color = _completedColor;
    } else {
      color = _inactiveColor;
    }

    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: 25,
          height: 25,
          child: Center(
            child: Text(
              '${stepIndex}',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 6),
        if (step == stepIndex)
          Row(
            children: <Widget>[
              Text(title),
              const SizedBox(width: 6),
            ],
          )
        else
          const SizedBox(),
      ],
    );
  }

  Widget _buildConnector() {
    return Expanded(
      child: Container(height: 1, color: Colors.grey),
    );
  }
}
