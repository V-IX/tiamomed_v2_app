import "package:flutter/material.dart";

class DoctorDetailAppointmentProperty extends StatelessWidget {
  const DoctorDetailAppointmentProperty({
    super.key, required
    this.name,
    required this.value
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
                name,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF7D8186)
                )
            ),
            const SizedBox(width: 32),
            Flexible(
              child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF282F41)
                  )
              ),
            )
          ],
        ),
        const SizedBox(height: 6.0),
        Container(
            height: 1.0,
            width: double.infinity,
            color: const Color(0xFFDEDFE2)
        )
      ],
    );
  }
}
