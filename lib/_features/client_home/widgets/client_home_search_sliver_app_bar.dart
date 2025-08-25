import 'package:flutter/material.dart';

import 'client_home_search_text_field.dart';

class ClientHomeSearchSliverAppBar extends StatelessWidget {
  const ClientHomeSearchSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: ClientHomeSearchTextField(),
        centerTitle: true,
      ),
    );
  }
}
