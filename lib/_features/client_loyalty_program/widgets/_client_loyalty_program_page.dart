import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart' as provider;

import '../data/client_loyalty_program_repository.dart';
import '../di/client_loyalty_program_provider.dart';
import '../state/client_certificates/client_certificates_cubit.dart';
import '../state/client_season_tiсkets/client_season_tickets_cubit.dart';
import 'client_certificates_list.dart';
import 'client_season_ticket_list.dart';

class ClientLoyaltyProgramPage extends StatefulWidget {
  const ClientLoyaltyProgramPage({super.key});

  @override
  State<ClientLoyaltyProgramPage> createState() => _ClientLoyaltyProgramPageState();
}

class _ClientLoyaltyProgramPageState extends State<ClientLoyaltyProgramPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        clientLoyaltyProgramApiServiceProvider,
        clientLoyaltyProgramRepositoryProvider,
      ],
      child: bloc.MultiBlocProvider(
        providers: <SingleChildWidget>[
          bloc.BlocProvider<ClientCertificatesCubit>(
            create: (BuildContext context) => ClientCertificatesCubit(
              clientLoyaltyProgramRepository: context.read<ClientLoyaltyProgramRepository>(),
            )..getCertificates(),
          ),
          bloc.BlocProvider<ClientSeasonTicketsCubit>(
            create: (BuildContext context) => ClientSeasonTicketsCubit(
              clientLoyaltyProgramRepository: context.read<ClientLoyaltyProgramRepository>(),
            )..getSeasonTickets(),
          ),
        ],
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: ColoredBox(
                    color: const Color(0xFFEDEDED),
                    child: TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black54,
                      indicatorColor: Colors.black,
                      dividerHeight: 0,
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      indicator: BoxDecoration(
                        color: Colors.white,
                      ),
                      tabs: const <Widget>[
                        Tab(text: 'Сертификаты'),
                        Tab(text: 'Абонементы'),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: TabBarView(
                    clipBehavior: Clip.none,

                    controller: _tabController,
                    children: const <Widget>[
                      ClientCertificatesList(),
                      ClientSeasonTicketList()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
