import 'package:flutter/material.dart';

import 'client_feedback_form.dart';
import 'client_feedbacks_list.dart';

class ClientFeedbackPage extends StatefulWidget {
  const ClientFeedbackPage({super.key});

  @override
  State<ClientFeedbackPage> createState() => _ClientFeedbackPageState();
}

class _ClientFeedbackPageState extends State<ClientFeedbackPage>
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
      appBar: AppBar(title: const Text('Отзывы')),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
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
                Tab(text: 'Оставить отзыв'),
                Tab(text: 'Мои отзывы'),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: TabBarView(
              clipBehavior: Clip.none,

              controller: _tabController,
              children: const <Widget>[
                ClientFeedbackForm(),
                ClientFeedbacksList(feedbacks: []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
