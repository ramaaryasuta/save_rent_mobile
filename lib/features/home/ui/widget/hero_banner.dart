import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../utils/ui_helper.dart';
import '../../../../utils/utils_app.dart';
import 'components/logout_dialog.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: topPadding(context),
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(color: context.primaryColor),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SaveRent',
                style: context.headlineSmallTextStyle!.copyWith(
                  color: context.onPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  logoutDialog(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: context.onPrimaryColor,
                  size: 22,
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: getGreetingByTime(),
            builder: (context, snapshot) {
              final textStyle = context.bodyMediumTextStyle!.copyWith(
                color: context.onPrimaryColor,
                fontWeight: FontWeight.bold,
              );
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Text(
                  "${snapshot.data.toString()} Admin",
                  style: textStyle,
                );
              } else {
                return Text('Loading...', style: textStyle);
              }
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Nilai Transaksi Hari Ini',
            style: context.bodyMediumTextStyle!.copyWith(
              color: context.onPrimaryColor,
            ),
          ),

          const TransactionWidget(),
        ],
      ),
    );
  }
}

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({super.key});

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  bool _obsecureValue = true;

  void _toggleView() {
    setState(() {
      _obsecureValue = !_obsecureValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Rp ',
                    style: context.bodyLargeTextStyle!.copyWith(
                      color: context.onPrimaryColor,
                    ),
                  ),
                  TextSpan(
                    text: _obsecureValue ? '*********' : '1,570,000',
                    style: context.titleLargeTextStyle!.copyWith(
                      color: context.onPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              onTap: _toggleView,
              child: Icon(
                _obsecureValue ? Icons.lock_outlined : Icons.lock_open_rounded,
                color: context.onPrimaryColor,
                size: 20,
              ),
            ),
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: context.onPrimaryColor.withValues(alpha: .2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            spacing: 5,
            children: [
              Text(
                '10 Transaksi',
                style: context.bodyMediumTextStyle!.copyWith(
                  color: context.onPrimaryColor,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
