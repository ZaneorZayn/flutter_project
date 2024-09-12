import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/core/text_theme.dart';
import 'package:new_project/screens/blogscreen/blog_screen.dart';
import 'package:new_project/screens/clinicscreen/clinic_screen.dart';
import 'package:new_project/screens/homescreen/home_screen.dart';
import 'package:new_project/screens/productscreen/product_screen.dart';

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
          brightness: Brightness.light, // or Brightness.dark
          primary: Color(0xFF2DB1E5), //blue
          onPrimary: Colors.white,
          secondary: Color(0xFFF49EC4), // pink
          onSecondary: Colors.black,
          tertiary: Color(0xFFECFAFF), // light blue
          onTertiary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
        ),
        textTheme: ResponsiveTextTheme.getTextTheme(context),
        // Additional styling if needed
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
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: Container(
        height: 80, // Adjust the height of the BottomNavigationBar
        decoration: const BoxDecoration(
          color: Color(0xffF5F7F8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTabTapped, // Handle tab tap
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icon/home.svg",
                color: _currentIndex == 0 
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icon/blog.svg",
                color: _currentIndex == 1 
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
              ),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icon/clinic.svg",
                color: _currentIndex == 2 
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
              ),
              label: 'Clinic',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icon/product.svg",
                color: _currentIndex == 3 
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey,
              ),
              label: 'Product',
            ),
          ],
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.grey[100], 
          elevation: 2,
          
          // Make the background transparent to show Container's color
        ),
      ),
    );
  }
}
