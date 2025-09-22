import 'package:flutter/material.dart';

import '../widget/add_unit_container.dart';
import '../widget/hero_banner.dart';
import '../widget/rent_activity_container.dart';
import '../widget/transaction_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroBanner(),
            TransactionContainer(),
            AddUnitContainer(),
            RentActivityContainer(),
          ],
        ),
      ),
    );
  }
}
