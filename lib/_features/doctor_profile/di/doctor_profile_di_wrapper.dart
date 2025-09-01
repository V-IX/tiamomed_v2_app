import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../_shared/di/doctor_provider.dart';

class DoctorProfileDiWrapper extends StatelessWidget {
  const DoctorProfileDiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        doctorApiServiceProvider,
        doctorRepositoryProvider,
      ],
      child: child,
    );
  }
}
