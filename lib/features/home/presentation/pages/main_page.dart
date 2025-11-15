import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../favorites/presentation/pages/favorites_page.dart';
import '../../../messages/presentation/pages/messages_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FavoritesPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'.tr()),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'.tr()),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'.tr()),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'.tr()),
        ],
      ),
    );
  }
}
