import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/core/text_theme.dart';
import 'package:new_project/screens/blogscreen/blog_screen.dart';
import 'package:new_project/screens/clinicscreen/clinic_screen.dart';
import 'package:new_project/screens/homescreen/home_screen.dart';
import 'package:new_project/screens/productscreen/product_screen.dart';
import 'package:animations/animations.dart'; // Import animations package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF2DB1E5), // Blue
          onPrimary: Colors.white,
          secondary: Color(0xFFF49EC4), // Pink
          onSecondary: Colors.black,
          tertiary: Color(0xFFECFAFF), // Light blue
          onTertiary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        textTheme: ResponsiveTextTheme.getTextTheme(context),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // List of screens for navigation
  final List<Widget> _screens = [
    HomeScreen(),
    BlogScreen(),
    ClinicScreen(),
    ProductScreen(),
  ];

  // Function to handle navigation
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped, // Handle tab tap
        items: [
          _buildBottomNavigationBarItem(
            iconPath: "assets/icon/home.svg",
            label: 'Home',
            isSelected: _currentIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            iconPath: "assets/icon/blog.svg",
            label: 'Blog',
            isSelected: _currentIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            iconPath: "assets/icon/clinic.svg",
            label: 'Clinic',
            isSelected: _currentIndex == 2,
          ),
          _buildBottomNavigationBarItem(
            iconPath: "assets/icon/product.svg",
            label: 'Product',
            isSelected: _currentIndex == 3,
          ),
        ],
        selectedItemColor: const Color(0xffC9379D),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.grey[100],
        elevation: 2,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: SvgPicture.asset(
          iconPath,
          key: ValueKey<bool>(isSelected),
          color: isSelected ? const Color(0xffC9379D) : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
