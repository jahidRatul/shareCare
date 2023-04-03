import 'package:flutter/material.dart';
import 'package:share_care/presentation/view/homepage/homepage.dart';
import 'package:share_care/presentation/view/my_books/my_books_page.dart';
import 'package:share_care/presentation/view/settings/settings_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTabTapped(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  final List<Widget> _tabs = [
    Navigator(
      key: const Key('home'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Homepage());
      },
    ),
    Navigator(
      key: const Key('requests'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const MyBooksPage());
      },
    ),
    Navigator(
      key: const Key('settings'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const SettingsPage());
      },
    ),
  ];

  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: _tabs,
    );
  }
}
