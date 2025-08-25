import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/other/void_callback_util.dart';

class SelectMonthWidget extends StatefulWidget {
  const SelectMonthWidget({
    super.key,
    required this.setMonthNumber,
    required this.monthNumber,
    required this.months
  });

  final VoidCallbackWithInt setMonthNumber;
  final int monthNumber;
  final List<String> months;

  @override
  State<SelectMonthWidget> createState() => _SelectMonthWidgetState();
}

class _SelectMonthWidgetState extends State<SelectMonthWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        color: const Color(0xFFE8E8E8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const <BoxShadow>[
          BoxShadow(
            color: Color(0x63D6DBE1),
            blurRadius: 40,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: (){
            setState(() {
              if(widget.monthNumber > 0) {
                widget.setMonthNumber(widget.monthNumber - 1);
              }
            });
          }, icon: const Icon(Icons.arrow_back_ios)),
          Text(
            DateFormat.yMMMM("ru")
              .format(widget.months.isEmpty ? DateTime.now() : DateFormat('dd.MM.yyyy').parse('01.${widget.months[widget.monthNumber]}'))
              ,//.toDateWithoutAgeLetter(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF282F41),
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          IconButton(
            onPressed: (){
              setState(() {
                if(widget.monthNumber < widget.months.length - 1) {
                  widget.setMonthNumber(widget.monthNumber + 1);
                }
              });
            },
            icon: const Icon(Icons.arrow_forward_ios)
          ),
        ],
      ),
    );
  }
}
