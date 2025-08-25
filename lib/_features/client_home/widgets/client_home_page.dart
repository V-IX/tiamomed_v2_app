import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../client_feedback/routes/client_feedback_route.dart';
import '../../client_files/routes/client_files_route.dart';
import '../../client_visit_history/routes/client_visit_history_route.dart';
import 'client_home_bonus_count_card.dart';
import 'client_home_menu_card.dart';
import 'client_home_search_sliver_app_bar.dart';
import 'client_home_user_card.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const ClientHomeSearchSliverAppBar()
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ClientHomeUserCard(),
                const ClientHomeBonusCountCard(),
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Flexible(
                      child: ClientHomeMenuCard(
                        title: 'Посещения',
                        subtitle: 'История посещений',
                        onTap: () {
                          context.go(ClientVisitHistoryRoute.path);
                        },
                      ),
                    ),
                    Flexible(
                      child: ClientHomeMenuCard(
                        title: 'Мои файлы',
                        subtitle: 'Анализы, фото и видео',
                        onTap: () {
                          context.go(ClientFilesRoute.path);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  spacing: 16,
                  children: <Widget>[
                    Flexible(
                      child: ClientHomeMenuCard(
                        title: 'Мои отзывы',
                        subtitle: 'Отзывы и предложения',
                        onTap: () {
                          context.go(ClientFeedbackRoute.path);
                        },
                      ),
                    ),
                    Flexible(
                      child: ClientHomeMenuCard(
                        title: 'Рассрочка',
                        subtitle: 'Оформление и история',
                        onTap: () {},
                      ),
                    )
                  ],
                ),
                const Text('Предоставляемые услуги'),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        context.pushNamed(
                          'service_categories',
                          pathParameters: <String, String>{'id': Random.secure().nextInt(1000).toString()},
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 44, horizontal: 22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: const Icon(Icons.image)),
                            const Text('1'),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
                const SizedBox(height: 100)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
