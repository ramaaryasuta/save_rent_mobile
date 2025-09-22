import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';

class MIconButton extends StatelessWidget {
  const MIconButton({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 55, minWidth: 55),
      child: InkWell(
        onTap: onTap,
        child: Column(
          spacing: 5,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: context.onPrimaryColor.withValues(alpha: .3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: context.onPrimaryColor),
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: context.bodyMediumTextStyle!.copyWith(
                color: context.onPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
