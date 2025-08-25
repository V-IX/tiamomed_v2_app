import 'package:flutter/material.dart';


class ClientHomeUserCard extends StatelessWidget {
  const ClientHomeUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Column(
          children: <Widget>[
            Text('Евгений'),
            Text('Пациент'),
          ],
        ),
        SizedBox(
          height: 54,
          width: 54,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    shape: BoxShape.circle,
                  ),
                )
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black12),
                    ),
                    onPressed: (){
                      //context.push(Routers.newAppointmentSelectDoctorRoute.path);
                    },
                    icon: const Icon(Icons.notifications, color: Colors.black26,),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
