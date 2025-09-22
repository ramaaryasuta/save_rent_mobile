import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';

class RentTile extends StatelessWidget {
  const RentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: context.onPrimaryColor.withValues(alpha: .3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: context.onPrimaryColor.withValues(alpha: .3),
          child: Text(
            'Y',
            style: context.titleMediumTextStyle!.copyWith(
              color: context.onPrimaryColor,
            ),
          ),
        ),
        title: Text(
          'Aris',
          overflow: TextOverflow.ellipsis,
          style: context.titleMediumTextStyle!.copyWith(
            color: context.onPrimaryColor,
          ),
        ),
        subtitle: Text(
          'Yamaha Mio',
          overflow: TextOverflow.ellipsis,
          style: context.bodyMediumTextStyle!.copyWith(
            color: context.onPrimaryColor,
          ),
        ),
        trailing: Text(
          '8/12/2023',
          style: context.bodySmallTextStyle!.copyWith(
            color: context.onPrimaryColor,
          ),
        ),
      ),
    );
  }
}
