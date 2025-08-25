import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:intl/intl.dart';

import '../../../_shared/widgets/dash_line.dart';
import '../../doctor_home/widgets/appointment_card.dart';
import '../state/doctor_schedule/doctor_schedule_bloc.dart';

class DoctorScheduleAppointments extends StatelessWidget {
  const DoctorScheduleAppointments({super.key, required this.selectedDay});

  final DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        spacing: 16,
        children: [
          const DashLine(),
          Row(
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                      text: "Выбранная дата:  ",
                      style: TextStyle(
                        color: Color(0xFF7C8085),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: DateFormat.yMMMMd("ru").format(selectedDay ?? DateTime.now()),
                      style: const TextStyle(
                        color: Color(0xFF282F41),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const DashLine(),
          bloc.BlocBuilder<DoctorScheduleBloc, DoctorScheduleState>(
            builder: (context, state) {
              return switch (state) {
                DoctorScheduleInitial() => const CircularProgressIndicator(),
                DoctorScheduleLoading() => const CircularProgressIndicator(),
                DoctorScheduleError() => Text(state.message),
                DoctorScheduleLoaded() => Flexible(
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: 200),
                    itemBuilder: (BuildContext context, int index) {
                      return AppointmentCard(
                        appointment: state.appointments[index],
                        onTap: () {  },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: state.appointments.length
                  ),
                )
              };
            }
          )
        ],
      ),
    );
  }
}
