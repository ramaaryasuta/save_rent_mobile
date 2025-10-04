import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import 'components/icon_button.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.onPrimaryColor,
        border: Border.all(color: context.outlineColor.withValues(alpha: .2)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.shadowColor.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Armada',
            style: context.titleMediumTextStyle!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              MIconButton(
                title: 'Motor',
                icon: const Icon(Icons.motorcycle),
                onTap: () {},
              ),
              MIconButton(
                title: 'Mobil',
                icon: const Icon(Icons.car_rental_outlined),
                onTap: () {},
              ),
              MIconButton(
                title: 'Aksesoris',
                icon: const Icon(Icons.headset_mic_outlined),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
