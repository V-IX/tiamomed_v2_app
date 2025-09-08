import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../constants/image_paths.dart';
import '../models/client_season_ticket.dart';

class ClientSeasonTicketCard extends StatelessWidget {
  const ClientSeasonTicketCard({super.key, required this.clientSeasonTicket});

  final ClientSeasonTicket clientSeasonTicket;

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
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: BarcodeWidget(
                  data: clientSeasonTicket.barcode,
                  barcode: Barcode.code128(),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 200,
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
                    color: Colors.white,
                    child: Text("№${clientSeasonTicket.barcode}"),
                  ),
                  Text(
                    'Годен до ${clientSeasonTicket.validDate}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 44),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "1",
                  //         style: const TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w700,
                  //           fontSize: 50,
                  //         ),
                  //       ),
                  //       const TextSpan(
                  //         text: ' руб.',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 20,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const Text(
                    'Узнать подробнее об услугах',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: BarcodeWidget(
                data: clientSeasonTicket.barcode,
                barcode: Barcode.code128(),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                style: TextStyle(fontSize: 0),
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
