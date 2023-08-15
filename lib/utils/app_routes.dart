import 'package:cash_wallet/pages/home_page/main_page.dart';
import 'package:cash_wallet/pages/home_page/tabs/home/widgets/app_navigation_bar.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = AppRoutes.getRouter();

class AppRoutes {
  static List<GoRoute> getRoutes() {
    return [
      GoRoute(
        path: MainPage.route,
        redirect: (BuildContext context, GoRouterState state) => '${MainPage.route}${AppTabs.values.first.name}',
        routes: [
          GoRoute(
            path: ':${MainPage.tabKey}(${AppTabs.values.map((e) => e.name).join("|")})',
            builder: (BuildContext context, GoRouterState state) {
              final tab = AppTabs.values.firstOrNullWhere((element) => (state.pathParameters[MainPage.tabKey] == element.name));

              return MainPage(tab: tab);
            },
          ),
        ],
      ),
    ];
  }

  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: MainPage.route,
      routes: AppRoutes.getRoutes(),
      errorBuilder: (context, state) => ErrorScreen(state: state),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final GoRouterState state;
  const ErrorScreen({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("404"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(state.error.toString()),
            ElevatedButton(
              onPressed: () => context.go(MainPage.route),
              child: const Text("Go to home page"),
            ),
          ],
        ),
      ),
    );
  }
}
