import 'package:flutter/material.dart';

import '../widget/hero_banner.dart';
import '../widget/menu_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isCollapsed = false;
  final double expandedHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.metrics.axis == Axis.vertical) {
            final bool collapsed =
                scrollNotification.metrics.pixels >
                expandedHeight - kToolbarHeight;
            if (collapsed != _isCollapsed) {
              setState(() {
                _isCollapsed = collapsed;
              });
            }
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: _isCollapsed ? const Text('Save Rent') : null,
              pinned: true,
              expandedHeight: expandedHeight,
              flexibleSpace: const FlexibleSpaceBar(background: HeroBanner()),
            ),
            const SliverToBoxAdapter(
              child: Column(children: [MenuContainer()]),
            ),
          ],
        ),
      ),
    );
  }
}
