import 'package:flutter/material.dart';

import '../../../../_shared/widgets/other/image_loader.dart';
import '../../../../_shared/models/doctor/doctor.dart';

class ClientSelectableDoctorCard extends StatelessWidget {
  const ClientSelectableDoctorCard({
    super.key,
    required this.doctor, required this.isSelectedDoctor, required this.onTap
  });

  final Doctor doctor;
  final bool isSelectedDoctor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            border: isSelectedDoctor ? Border.all(color: Theme.of(context).colorScheme.primary, width: 1, strokeAlign: BorderSide.strokeAlignOutside)
                : null,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 16,
              ),
            ],
            color: Colors.white
        ),
        child: Row(
          children: <Widget>[
            ImageLoader(
              height: 64.0,
              width: 64.0,
              borderRadius: BorderRadius.circular(8),
              url: doctor.profileImageUrl,
              icon: const Icon(Icons.account_circle, color: Colors.black87, size: 32),
            ),

            const SizedBox(width: 16.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )
                  ),
                  Text(
                      doctor.doctorPosition.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
