import 'package:e_car/Home/home.dart';
import 'package:e_car/intro%20page/onboarding.dart';
import 'package:e_car/login/screens/carVerifScreen.dart';
import 'package:e_car/login/screens/logScreen.dart';
import 'package:e_car/navbar/bottom-nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      initialRoute: '/test',
      routes: {
        '/intro': (context) => const Onboarding(),
        '/login': (context) => const LogScreen(),
        '/home': (context) => const BottomNav(),
        '/test': (context) => const CarVerifyScreen(),
      },
    );
  }
}

// 1. Intro/Splash Screen (First screen users see )
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to My App!'),
            ElevatedButton(
              onPressed: () {
                // Navigate to home after intro
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Main Page with Bottom Navigation
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Pages for bottom navigation
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My App')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Screen'));
  }
}
