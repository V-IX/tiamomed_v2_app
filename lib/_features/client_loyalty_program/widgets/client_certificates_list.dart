import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/client_loyalty_program_repository.dart';
import '../state/client_certificates/client_certificates_cubit.dart';
import 'client_certificate_card.dart';

class ClientCertificatesList extends StatelessWidget {
  const ClientCertificatesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCertificatesCubit, ClientCertificatesState>(
      builder: (BuildContext context, ClientCertificatesState state) {
        return switch (state) {
          ClientCertificatesInitial() => const Center(child: CircularProgressIndicator()),
          ClientCertificatesLoading() => const Center(child: CircularProgressIndicator()),
          ClientCertificatesError() => Center(child: Text(state.message)),
          ClientCertificatesLoaded() => RefreshIndicator(
            onRefresh: () async {
              context.read<ClientCertificatesCubit>().getCertificates();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(22),
              itemBuilder: (BuildContext context, int index) {
                return ClientCertificateCard(certificate: state.certificates[index]);
              },
              separatorBuilder: (_, int index) {
                return const SizedBox(height: 12);
              },
              itemCount: state.certificates.length,
            ),
          ),
        };
      },
    );
  }
}
