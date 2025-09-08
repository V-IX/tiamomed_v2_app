import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:provider/provider.dart' as provider;

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../data/client_feedback_repository.dart';
import '../di/client_feedback_provider.dart';
import '../state/client_feedback_bloc.dart';
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
    return provider.MultiProvider(
      providers: [
        clientFeedbackApiServiceProvider,
        clientFeedbackRepositoryProvider,
      ],
      child: bloc.BlocProvider(
        create: (BuildContext context) {
          return ClientFeedbackBloc(
            clientFeedbackRepository: context.read<ClientFeedbackRepository>(),
          )
            ..add(GetClientFeedbacksEvent());
        },
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Отзывы'),
          body: Column(
            children: [
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
                      Tab(text: 'Оставить отзыв'),
                      Tab(text: 'Мои отзывы'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              bloc.BlocBuilder<ClientFeedbackBloc, ClientFeedbackState>(
                builder: (context, state) {
                  return Expanded(
                    child: TabBarView(
                      clipBehavior: Clip.none,

                      controller: _tabController,
                      children: <Widget>[
                        const ClientFeedbackForm(),
                        switch(state.status) {
                          ClientFeedbackStatus.initial => const Center(child: CircularProgressIndicator()),
                          ClientFeedbackStatus.loading => const Center(child: CircularProgressIndicator()),
                          ClientFeedbackStatus.error => const Center(child: Text('Ошибка')),
                          ClientFeedbackStatus.loaded => ClientFeedbacksList(feedbacks: state.feedbacks),
                        }
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
