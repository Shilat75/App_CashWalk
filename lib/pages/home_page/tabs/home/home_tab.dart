import 'package:cash_wallet/pages/home_page/tabs/home/widgets/clip_card.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomCard(
                  height: 150,
                  width: 200,
                  child: ClipCard(),
                )
              ],
            )));
  }
}
