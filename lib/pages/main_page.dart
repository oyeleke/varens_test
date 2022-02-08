import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:varens_test/constants/assets_constants.dart';
import 'package:varens_test/constants/colors.dart';
import 'package:varens_test/pages/exchange_page.dart';
import 'package:varens_test/pages/graph_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    GraphPage(),
    Container(),
    Container(),
    Container(),
  ];

  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _selectedIndex,
          children: [..._pages],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          fixedColor: Colors.white,
          elevation: 0.0,
          type: BottomNavigationBarType.fixed,
          onTap: _onTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: '.',
                icon: Image.asset(Assets.ic_nav_home,
                  color: AppColors.navInActiveColor,
                ),
                activeIcon: Image.asset(
                  Assets.ic_nav_home,
                  color: AppColors.navActiveColor,
                )),
            BottomNavigationBarItem(
                label: '.',
                icon: Image.asset(Assets.ic_nav_status,
                  color: AppColors.navInActiveColor,
                ),
                activeIcon: Image.asset(
                  Assets.ic_nav_status,
                  color: AppColors.navActiveColor,
                )),
            BottomNavigationBarItem(
                label: '.',
                icon: Image.asset(Assets.ic_nav_wallet,
                  color: AppColors.navInActiveColor,
                ),
                activeIcon: Image.asset(
                  Assets.ic_nav_wallet,
                  color: AppColors.navActiveColor,
                )),
            BottomNavigationBarItem(
                label: '.',
                icon: Image.asset(Assets.ic_nav_profile,
                  color: AppColors.navInActiveColor,
                ),
                activeIcon: Image.asset(
                  Assets.ic_nav_profile,
                  color: AppColors.navActiveColor,
                )),
          ],
        ),
      );
  }
}
