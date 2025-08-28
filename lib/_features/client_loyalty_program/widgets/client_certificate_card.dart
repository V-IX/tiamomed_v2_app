import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants/image_paths.dart';
import '../models/client_certificate.dart';

class ClientCertificateCard extends StatelessWidget {
  const ClientCertificateCard({super.key, required this.certificate});

  final ClientCertificate certificate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          barrierColor: Colors.black87,
          barrierDismissible: true, // закрыть по тапу вне QR
          builder: (_) {
            return Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: QrImageView(
                  data: certificate.certificateUrl,
                  size: 250, // размер QR в диалоге
                  backgroundColor: Colors.white,
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
            image: AssetImage(certificateBgImagePath),
            fit: BoxFit.cover, // обрезает/растягивает по размеру
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Text(certificate.id),
                  ),
                  Text(
                    'Годен до ${certificate.validDate}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 22),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: certificate.initialBalance,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 50,
                          ),
                        ),
                        const TextSpan(
                          text: ' руб.',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Остаток: ${certificate.currentBalance} руб.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: QrImageView(
                  data: certificate.certificateUrl,
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
