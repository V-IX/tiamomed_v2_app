import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../_shared/models/doctor/doctor.dart';

class ProfileDoctorCard extends StatelessWidget {
  const ProfileDoctorCard({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 8.0),
          height: 64.0,
          width: 64.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white
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
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  )
              ),
              Text(
                  doctor.doctorPosition.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}
