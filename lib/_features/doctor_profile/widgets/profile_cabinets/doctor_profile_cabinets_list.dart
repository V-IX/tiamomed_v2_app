import'package:flutter/material.dart';

import '../../../../_shared/models/doctor/cabinet.dart';

class DoctorProfileCabinetsList extends StatelessWidget {
  const DoctorProfileCabinetsList({super.key, required this.cabinets});

  final List<Cabinet> cabinets;

  @override
  Widget build(BuildContext context) {
    return cabinets.isEmpty
      ? const Padding(
        padding: EdgeInsets.only(top: 22),
        child: Center(
          child: Text('Список кабинетов отсутствует'),
        )
      )
      : ListView.separated(
        padding: const EdgeInsets.all(16.0),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(8),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 16,
                ),
              ],
              color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Кабинет',
                  style: TextStyle(
                    color: Color(0xFF7C8085),
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  cabinets[index].name,
                  style: const TextStyle(
                    color: Color(0xFF282F41),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          );
        },
        separatorBuilder: (BuildContext context, int index){
          return const SizedBox(height: 10.0);
        },
        itemCount: cabinets.length
      );
  }
}
