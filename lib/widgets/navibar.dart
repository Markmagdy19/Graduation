
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../screens/chat_screen.dart';
import '../screens/home_screen.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/pubmed.dart';
import '../ui/pages/settings_page.dart';

class Navigatebar extends StatefulWidget {
  const Navigatebar({super.key});

  @override
  _NavigatebarState createState() => _NavigatebarState();
}

int _selectedIndex = 0;

class _NavigatebarState extends State<Navigatebar> {
  final List<Widget> listWidget = [
    ArticleListScreen(),
    const HomePage(),
    const HomeScreen() ,
    const SettingsPageUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (val) {
            setState(() {
              _selectedIndex = val;
            });
          },
          currentIndex: _selectedIndex,
          //backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          //selectedFontSize: 20,
          //unselectedFontSize: 14,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),

          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home), label: S.of(context).home),
            BottomNavigationBarItem(
                icon: const Icon(Icons.edit), label: S.of(context).todo),
            BottomNavigationBarItem(
                icon: const Icon(Icons.chat), label: S.of(context).chat),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: S.of(context).settings),
          ],
        ),
        body: Container(child: listWidget.elementAt(_selectedIndex)));
  }
}
