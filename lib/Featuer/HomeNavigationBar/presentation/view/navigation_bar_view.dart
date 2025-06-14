import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:freely/Featuer/Home%20page/presentation/view/hompage_view.dart';
import 'package:freely/Featuer/Profile/presentation/view/profile_view.dart';
import 'package:freely/Featuer/Shopping%20Cart/presentation/view/sohpping_cart_page.dart';

class HomePageNavigationBar extends StatefulWidget {
  const HomePageNavigationBar({super.key});

  @override
  State<HomePageNavigationBar> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageNavigationBar> {
  int _currentIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.shopping_cart,
    Icons.person,
    Icons.settings,
  ];

  final List<Widget> _pages = const [
    HomPageView(),
    ShoppingCartPage(),
    ProfilePage(),
    Center(child: Text("الإعدادات", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: _pages[_currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            activeIndex: _currentIndex,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.softEdge,
            backgroundColor: Colors.white,
            activeColor: Colors.blue.shade700,
            inactiveColor: Colors.grey.shade400,
            splashColor: Colors.blue.shade100,
            leftCornerRadius: 20,
            rightCornerRadius: 20,
            onTap: (index) => setState(() => _currentIndex = index),
          ),
        ),
      ),
    );
  }
}
