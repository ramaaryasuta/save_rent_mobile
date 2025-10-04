import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';

class MIconButton extends StatelessWidget {
  const MIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 60, minWidth: 60),
      child: InkWell(
        onTap: onTap,
        child: Column(
          spacing: 5,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.primaryColor.withValues(alpha: .15),
              ),
              child: icon,
            ),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
