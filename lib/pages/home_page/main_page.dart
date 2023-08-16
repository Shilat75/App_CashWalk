import 'package:cash_wallet/pages/base/base_translation.dart';
import 'package:cash_wallet/pages/home_page/tabs/home/widgets/app_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';

class MainPage extends StatefulWidget {
  static const String route = "/";
  static const tabKey = "tab";

  final AppTabs? tab;

  const MainPage({super.key, this.tab});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with BaseTranslation {
  final navBarSubject = BehaviorSubject<AppTabs>.seeded(AppTabs.home);
  @override
  void initState() {
    if (widget.tab != null) navBarSubject.add(widget.tab!);
    super.initState();
  }

  @override
  String get route => 'main';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppTabs>(
        stream: navBarSubject.distinct(),
        initialData: AppTabs.home,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final AppTabs tab = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(tran('app')),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            bottomNavigationBar: AppNavigationBar(navBarSubject: navBarSubject, onSelected: _onItemTapped),
            body: _getBody(tab),
          );
        });
  }

  // BottomNavigationBar _getBottomNavBar(AppTabs selectedTab) {
  //   return BottomNavigationBar(
  //     items: AppTabs.values.map((e) {
  //       return BottomNavigationBarItem(
  //         icon: e.icon,
  //         label: e.name,
  //       );
  //     }).toList(),
  //     currentIndex: selectedTab.index,
  //     onTap: _onItemTapped,
  //   );
  // }

  Widget _getBody(AppTabs selectedTab) => selectedTab.tab();

  void _onItemTapped(int index) => navBarSubject.add(AppTabs.values[index]);
}
