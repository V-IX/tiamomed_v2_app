import 'package:flutter/material.dart';

import '../../../../_shared/widgets/dash_line.dart';

class ProfileLogoutButton extends StatelessWidget {
  const ProfileLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        //context.read<AuthBloc>().add(LogOutEvent());
      },
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 24,
                width: 24,
                child: Image.asset('assets/images/pink_bag.png'),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Выход с аккаунта',
                  style: TextStyle(
                    color: Color(0xFFFF0066),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              const SizedBox(
                width: 16,
                height: 16,
                child: Icon(Icons.arrow_forward_ios_sharp, size: 16, color: Color(0xFFFF0066)),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const DashLine()
        ],
      )
    );
  }
}
