import 'package:flutter/material.dart';

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import 'add_client_service_promotion_form.dart';
import 'client_service_promotion_history_list.dart';

class ClientServicePromotionPage extends StatefulWidget {
  const ClientServicePromotionPage({super.key});

  @override
  State<ClientServicePromotionPage> createState() => _ClientServicePromotionPageState();
}

class _ClientServicePromotionPageState extends State<ClientServicePromotionPage>
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
      appBar: CustomAppBar(title: 'Продвижение услуг'),
      body: Column(
        children: [
          Container(
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
                  Tab(text: 'Создание'),
                  Tab(text: 'История'),
                ],
              ),
            ),
          ),
          

          Expanded(
            child: TabBarView(
              clipBehavior: Clip.none,

              controller: _tabController,
              children: const <Widget>[
                AddClientServicePromotionForm(),
                ClientServicePromotionHistoryList(),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
