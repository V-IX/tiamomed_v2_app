import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorAddAppointmentFloatingButtons extends StatelessWidget {
  const DoctorAddAppointmentFloatingButtons({super.key, this.onNextTap, this.onBackTap});

  final VoidCallback? onNextTap;
  final VoidCallback? onBackTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: <Widget>[
          FloatingActionButton(
              heroTag: 'back_btn',
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              backgroundColor: Colors.grey,
              elevation: 0,
              onPressed: onBackTap ?? () {
                context.pop();
              },
              child: const Icon(Icons.arrow_back, color: Colors.white)
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FloatingActionButton(
                heroTag: 'next_btn',
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                backgroundColor: onNextTap == null ? Colors.grey : Theme.of(context).colorScheme.primary,
                elevation: 0,
                onPressed: onNextTap,
                child: const Text('Продолжить', style: TextStyle(color: Colors.white))
            ),
          ),
        ],
      ),
    );
  }
}
