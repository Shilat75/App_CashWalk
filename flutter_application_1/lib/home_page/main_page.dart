import 'package:cash_wallet/home_page/tabs/tabs_enum.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: _getBottomNavBar(),
      body: _getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  BottomNavigationBar _getBottomNavBar() {
    return BottomNavigationBar(
      items: AppTabs.values.map((e) {
        return BottomNavigationBarItem(
          icon: e.icon,
          label: e.name,
        );
      }).toList(),
      currentIndex: _selectedIndex,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  Widget _getBody() {
    return AppTabs.values[_selectedIndex].getWidget;
  }
}
