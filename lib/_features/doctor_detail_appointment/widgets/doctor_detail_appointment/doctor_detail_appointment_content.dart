import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../_shared/widgets/dash_line.dart';
import '../../../../utils/other/date_util.dart';
import 'doctor_detail_appointment_property.dart';

class DoctorDetailAppointmentContent extends StatelessWidget {
  const DoctorDetailAppointmentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    "Кабент такой-то",//"state.detailRecord.cabinet.name",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            DoctorDetailAppointmentProperty(
              name: "Запись на прием",
              value: "#${111111}"//state.detailRecord.id}",
            ),
            DoctorDetailAppointmentProperty(
              name: "Дата приема",
              value: DateFormat.yMMMMd("ru")
                .format(
                  DateFormat("yyyy/MM/dd").parse(
                    "2025/08/22"//"${state.detailRecord.date.substring(0, 4)}/${state.detailRecord.date.substring(4, 6)}/${state.detailRecord.date.substring(6, 8)}",
                  ),
                )
                .toDateWithoutAgeLetter(),
            ),
            DoctorDetailAppointmentProperty(
              name: "Начало приема",
              value: "12:00"//state.detailRecord.timeStart,
            ),
            DoctorDetailAppointmentProperty(
              name: "Конец приема",
              value: "13:00"//state.detailRecord.timeEnd,
            ),
            const SizedBox(height: 20.0),

            const Row(
              children: <Widget>[
                Text(
                    "Описание приема",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ],
            ),

            const SizedBox(height: 18.0),

            // ListView.separated(
            //     padding: EdgeInsets.zero,
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder:(BuildContext context, int index) {
            //       return RecordDetailUslugaCard(usluga: state.detailRecord.uslugi[index].detailUsluga, index: index);
            //     },
            //     separatorBuilder:(BuildContext context, int index){
            //       return const SizedBox(height: 10.0);
            //     },
            //     itemCount: state.detailRecord.uslugi.length
            // ),
            const SizedBox(height: 32.0),
            //todo remove files variable from state and use detailRecord.files
            //if(state.detailRecord.files.isNotEmpty)
            if(false)
            const Row(
                children: <Widget>[
                  Text(
                      "Загруженные файлы",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ],
              ),
            const SizedBox(height: 8.0),

            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Flexible(child: Text(""))//state.detailRecord.files[index]))
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: const DashLine(),
                  );
                },
                itemCount: 0//state.detailRecord.files.length
            ),
            SizedBox(height: 120)
          ],
        ),
      ),
    );
  }
}
