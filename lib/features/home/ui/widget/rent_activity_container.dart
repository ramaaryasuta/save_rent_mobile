import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import 'components/rent_tile.dart';

class RentActivityContainer extends StatelessWidget {
  const RentActivityContainer({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Penyewa Aktif (5)',
                style: context.titleLargeTextStyle!.copyWith(
                  color: context.onPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: context.onPrimaryColor.withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Lihat Semua',
                        style: context.bodySmallTextStyle!.copyWith(
                          color: context.onPrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: context.onPrimaryColor,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const RentTile(),
          const RentTile(),
          const RentTile(),
        ],
      ),
    );
  }
}
