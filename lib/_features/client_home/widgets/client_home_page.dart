import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../../../constants/image_paths.dart';
import '../../auth/models/auth_user.dart';
import '../../auth/state/auth_bloc.dart';
import '../../client_bonuses/data/client_bonuses_repository.dart';
import '../../client_bonuses/di/client_bonuses_provider.dart';
import '../../client_feedback/routes/client_feedback_route.dart';
import '../../client_files/routes/client_files_route.dart';
import '../../client_service_categories/data/client_services_repository.dart';
import '../../client_service_categories/di/client_services_provider.dart';
import '../../client_service_promotion/routes/client_service_promotion_route.dart';
import '../../client_visit_history/routes/client_visit_history_route.dart';
import '../state/client_home/client_home_bloc.dart';
import 'client_home_bonus_count_card.dart';
import 'client_home_menu_card.dart';
import 'client_home_search_sliver_app_bar.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        clientServicesApiServiceProvider,
        clientServicesRepositoryProvider,
        clientBonusesApiServiceProvider,
        clientBonusesRepositoryProvider,
      ],
      child: bloc.BlocProvider<ClientHomeBloc>(
        create: (BuildContext context) => ClientHomeBloc(
          clientServicesRepository: context.read<ClientServicesRepository>(),
          clientBonusesRepository: context.read<ClientBonusesRepository>(),
        )..add(LoadClientHomeEvent()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState authState) {
            return Scaffold(
              body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
                builder: (BuildContext context, ClientHomeState state) {
                  return switch(state) {
                    ClientHomeInitial() => const Center(child: CircularProgressIndicator()),
                    ClientHomeLoading() => const Center(child: CircularProgressIndicator()),
                    ClientHomeError() => Center(child: Text(state.message)),
                    ClientHomeLoaded() => CustomScrollView(
                      slivers: <Widget>[
                        ClientHomeSearchSliverAppBar(
                          fio: authState.user?.fio ?? '',
                          userType: authState.user!.userType,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(22.0),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate(<Widget>[
                              const SizedBox(height: 16),
                              const ClientHomeBonusCountCard(),
                              const SizedBox(height: 16),
                              if (authState.user != null &&
                                  authState.user!.userType == UserType.sellerClient)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Ink(
                                    decoration: const BoxDecoration(color: Colors.white),
                                    child: InkWell(
                                      onTap: () {
                                        context.goNamed(ClientServicePromotionRoute.name);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            const Text('Продвижение услуг'),
                                            const SizedBox(width: 22),
                                            Icon(Icons.chevron_right)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

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
                                      imagePath: historyIconPath,
                                    ),
                                  ),
                                  Flexible(
                                    child: ClientHomeMenuCard(
                                      title: 'Мои файлы',
                                      subtitle: 'Анализы, фото и видео',
                                      onTap: () {
                                        context.go(ClientFilesRoute.path);
                                      },
                                      imagePath: filesIconPath,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
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
                                      imagePath: feedbackIconPath,
                                    ),
                                  ),
                                  Flexible(
                                    child: ClientHomeMenuCard(
                                      title: 'Рассрочка',
                                      subtitle: 'Оформление и история',
                                      onTap: () {},
                                      imagePath: creditIconPath,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 22),
                              const Text(
                                'Предоставляемые услуги',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 12),
                              GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 0.88,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                        'service_categories',
                                        pathParameters: <String, String>{
                                          'id': Random.secure().nextInt(1000).toString(),
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(22),
                                      decoration: BoxDecoration(color: Colors.white),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: SvgPicture.network(
                                              state.categories[index].imageUrl,
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Text(
                                            state.categories[index].title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: state.categories.length,
                              ),
                              const SizedBox(height: 100),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  };
                }
              )
            );
          },
        ),
      ),
    );
  }
}
