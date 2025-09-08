part of 'client_certificates_cubit.dart';

@immutable
sealed class ClientCertificatesState {}

final class ClientCertificatesInitial extends ClientCertificatesState {}

final class ClientCertificatesLoading extends ClientCertificatesState {}

final class ClientCertificatesLoaded extends ClientCertificatesState {
  ClientCertificatesLoaded({required this.certificates});

  final List<ClientCertificate> certificates;
}

final class ClientCertificatesError extends ClientCertificatesState {
  ClientCertificatesError({required this.message });

  final String message;
}
