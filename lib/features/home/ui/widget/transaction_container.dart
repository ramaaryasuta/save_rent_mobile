import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import 'components/icon_button.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tambah Transaksi',
            style: context.titleLargeTextStyle!.copyWith(
              color: context.onPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children: [
              MIconButton(
                title: 'Motor',
                icon: Icons.motorcycle_outlined,
                onTap: () {},
              ),
              MIconButton(title: 'Mobil', icon: Icons.car_rental, onTap: () {}),
              MIconButton(
                title: 'Aksesoris',
                icon: Icons.headphones,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
