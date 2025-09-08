import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../models/client_visit.dart';
import '../routes/client_visit_details_route.dart';
import 'client_visit_history_card.dart';

class ClientVisitHistoryPage extends StatelessWidget {
  const ClientVisitHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'История посещений'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(22),
          child: Column(
            spacing: 22,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  'Для просмотра подробной информации о приёме просто нажмите на соответствующую строку всписке посещений',
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ClientVisitHistoryCard(data: ClientVisit(
                      id: '$index', date: '14.05.2025', bonuses: 100 + index),
                      onTap: (){
                        context.goNamed(ClientVisitDetailsRoute.name, pathParameters: {'client_visit_id': '$index'});
                      }
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
