import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../state/client_notifications_bloc.dart';
import 'client_notification_card.dart';

class ClientNotificationsPage extends StatelessWidget {
  const ClientNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Уведомления',
        ),
        body: BlocBuilder<ClientNotificationsBloc, ClientNotificationsState>(
            builder: (BuildContext context, ClientNotificationsState state) {
              return switch(state.status) {
                ClientNotificationsStatus.initial =>
                const Center(child: CircularProgressIndicator()),
                ClientNotificationsStatus.loading =>
                const Center(child: CircularProgressIndicator()),
                ClientNotificationsStatus.error =>
                    Center(child: Text(state.message)),
                ClientNotificationsStatus.loaded =>
                    ListView.separated(
                      padding: const EdgeInsets.only(left: 22, right: 22, top: 22, bottom: 200),
                    itemBuilder: (BuildContext context, int index) {

                      return VisibilityDetector(
                        key: Key('notification_$index'),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction > 0.95) {
                            context.read<ClientNotificationsBloc>().add(
                              MarkNotificationAsReadEvent(
                                id: state.notifications[0].id,
                              )
                            );
                          }
                        },
                        child: ClientNotificationCard(
                          notification: state.notifications[0],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: state.notifications.length
                  )

              };
            }
        )
    );
  }
}
