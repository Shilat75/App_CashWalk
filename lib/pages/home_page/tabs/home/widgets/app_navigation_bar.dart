import 'package:cash_wallet/pages/home_page/tabs/home/home_tab.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AppNavigationBar extends StatefulWidget {
  final BehaviorSubject<AppTabs> navBarSubject;
  final Function(int) onSelected;
  const AppNavigationBar({super.key, required this.navBarSubject, required this.onSelected});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppTabs>(
        initialData: widget.navBarSubject.value,
        stream: widget.navBarSubject,
        builder: (context, snapshot) {
          return NavigationBar(
            selectedIndex: snapshot.data!.index,
            onDestinationSelected: widget.onSelected,
            destinations: AppTabs.getNavigationDestination(context),
          );
        });
  }
}

enum AppTabs {
  home,
  wallet,
  share,
  user,
  ;

  String displayName(BuildContext context) {
    switch (this) {
      case home:
        return tr('main.app');
      default:
        return tr('main.app');
    }
  }

  Widget getIcon() {
    switch (this) {
      case home:
        return const Icon(Icons.home);
      default:
        return const Icon(Icons.bookmark_rounded);
    }
  }

  Widget selectedIcon() {
    switch (this) {
      case home:
        return const Icon(Icons.home_filled);
      default:
        return const Icon(Icons.bookmark_outline_rounded);
    }
  }

  Widget tab() {
    switch (this) {
      case home:
        return const HomeTab();
      default:
        return Center(child: Text(name));
    }
  }

  static List<NavigationDestination> getNavigationDestination(BuildContext context) {
    return AppTabs.values
        .map<NavigationDestination>((e) => NavigationDestination(
              tooltip: e.displayName(context),
              icon: e.getIcon(),
              label: e.displayName(context),
              selectedIcon: e.selectedIcon(),
            ))
        .toList();
  }
}
