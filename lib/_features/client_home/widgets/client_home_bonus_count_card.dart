import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../client_bonuses/routes/client_bonuses_route.dart';

class ClientHomeBonusCountCard extends StatelessWidget {
  const ClientHomeBonusCountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.goNamed(ClientBonusesRoute.name);
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(16)),
        child: Row(
          spacing: 16,
          children: <Widget>[
            Container(
              height: 88,
              width: 88,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: const Icon(Icons.image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: '120',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 54,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: 'баллов',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    //context.push(Routers.newAppointmentSelectDoctorRoute.path);
                  },
                  child: const Text(
                    'Узнать подробнее',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
