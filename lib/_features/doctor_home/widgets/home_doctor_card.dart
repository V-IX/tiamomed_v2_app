import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../doctor_profile/models/doctor.dart';

class HomeDoctorCard extends StatelessWidget {
  const HomeDoctorCard({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 16,
            ),
          ],
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 8.0),
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF5F5F6)
            ),
            child: doctor.profileImageUrl.isEmpty ?
            SvgPicture.asset('assets/images/profile_icon.svg') :
            CachedNetworkImage(
              imageUrl: doctor.profileImageUrl,
              fit: BoxFit.fitHeight,
              errorWidget: (BuildContext context, String url, Object error) => SvgPicture.asset('assets/images/profile_icon.svg'),
              placeholder: (BuildContext context, String url) => SvgPicture.asset('assets/images/profile_icon.svg'),
            ),
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
    );
  }
}
