import 'package:cash_wallet/home_page/tabs/home/widgets/clip_card.dart';
import 'package:flutter/material.dart';

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
                ClipCard(),
                ClipCard(),
              ],
            )));
  }
}
