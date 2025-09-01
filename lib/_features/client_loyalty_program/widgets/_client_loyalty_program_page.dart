import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //todo male theme
                color: const Color(0xFFEDEDED),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.black,
                dividerHeight: 0,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                tabs: const <Widget>[
                  Tab(text: 'Сертификаты'),
                  Tab(text: 'Абонементы'),
                ],
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
    );
  }
}
