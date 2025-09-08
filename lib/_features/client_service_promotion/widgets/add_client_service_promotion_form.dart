import 'package:flutter/material.dart';

class AddClientServicePromotionForm extends StatefulWidget {
  const AddClientServicePromotionForm({super.key});

  @override
  State<AddClientServicePromotionForm> createState() => _AddClientServicePromotionFormState();
}

class _AddClientServicePromotionFormState extends State<AddClientServicePromotionForm> {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fioController = TextEditingController();
  final TextEditingController _bdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Form(
        child: Column(
          spacing: 14,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Для создания скидки введите номер телефона. Мы сразу отправим на указанный номер персональный QR-код в Viber. QR-код действителен для одноразового использования.'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
              ),
            ),
            TextFormField(
              controller: _fioController,
              decoration: const InputDecoration(
                labelText: 'ФИО',
              ),
            ),
            TextFormField(
              controller: _bdController,
              decoration: const InputDecoration(
                labelText: 'Дата рождения',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 54,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {

                },
                child: const Text('Отправить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
