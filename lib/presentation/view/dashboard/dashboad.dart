import 'package:flutter/material.dart';
import 'package:share_care/presentation/view/homepage/homepage.dart';

class Dashboard extends StatefulWidget {
   Dashboard({Key? key}) : super(key: key);

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
    return  Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _onTabTapped(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
  List<Widget> _tabs = [
    Navigator(
      key: Key('home'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Homepage());
      },
    ),
    Navigator(
      key: Key('settings'),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Homepage());
      },
    ),
  ];
  Widget _buildBody() {
    return IndexedStack(
      index: _currentIndex,
      children: _tabs,
    );}

}
