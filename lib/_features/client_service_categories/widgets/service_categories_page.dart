import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../client_service_details/routes/service_details_route.dart';
import 'service_category_card.dart';

class ServiceCategoriesPage extends StatelessWidget {
  const ServiceCategoriesPage({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Услуги'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(categoryId),
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ServiceCategoryCard(
                  title: 'Услуга $index',
                  onTap: () {
                    if (false) {
                      context.pushNamed(
                        'service_categories',
                        pathParameters: <String, String>{
                          'id': Random.secure().nextInt(1000).toString(),
                        },
                      );
                    } else {
                      context.pushNamed(
                        ClientServiceDetailsRoute.name,
                        pathParameters: <String, String>{
                          'service_id': Random.secure().nextInt(1000).toString(),
                        },
                      );
                    }
                  },
                );
              },
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
