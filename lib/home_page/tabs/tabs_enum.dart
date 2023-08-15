import 'package:cash_wallet/home_page/tabs/home/home_tab.dart';
import 'package:flutter/material.dart';

enum AppTabs {
  home,
  wallet,
  share,
  user;

  Widget get icon {
    switch (this) {
      case AppTabs.home:
        return const Icon(Icons.home);

      default:
        return const Icon(Icons.abc);
    }
  }

  Widget get getWidget {
    switch (this) {
      case AppTabs.home:
        return const HomeTab();

      default:
        return Center(child: Text(name));
    }
  }
}
