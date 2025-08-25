import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/models/doctor/additional_service.dart';
import '../../../../_shared/models/doctor/doctor_service.dart';
import '../../../../_shared/widgets/dash_line.dart';

class SelectedDoctorServiceCard extends StatelessWidget {
  const SelectedDoctorServiceCard({super.key, required this.doctorService});

  final DoctorService doctorService;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: ShapeDecoration(
        color: const Color(0xB2E8E8E8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  doctorService.name,
                  style: const TextStyle(
                    color: Color(0xFF282F41),
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  //context.read<CreateAppointmentBloc>().add(RemoveServiceEvent(doctorService: doctorService));
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          if (doctorService.additionalServices.isNotEmpty)
            Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                const DashLine(),
                const SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            const TextSpan(
                              text: 'Услуга включает в себя: ',
                              style: TextStyle(
                                color: Color(0xFF686868),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            for (final (int index, AdditionalService item)
                                in doctorService.additionalServices.indexed)
                              TextSpan(
                                text:
                                    item.service.name +
                                    ((item.service.comment.isNotEmpty)
                                        ? ' (${item.service.comment})'
                                        : '') +
                                    ((index == doctorService.additionalServices.length - 1)
                                        ? '.'
                                        : ', '),
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (doctorService.comment.isNotEmpty)
            Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                const DashLine(),
                const SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            const TextSpan(
                              text: 'Комментарий: ',
                              style: TextStyle(
                                color: Color(0xFF686868),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: doctorService.comment,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          const SizedBox(height: 8.0),
          const DashLine(),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(
                      text: 'Стоимость: ',
                      style: TextStyle(
                        color: Color(0xFF686868),
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextSpan(
                      text: doctorService.price == '0.00'
                          ? 'Уточнять у врача'
                          : '${doctorService.price} BYN',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
