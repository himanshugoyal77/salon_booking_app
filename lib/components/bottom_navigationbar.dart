import 'package:flutter/material.dart';
import 'package:salon_app/screens/booking/booking_screen.dart';
import 'package:salon_app/screens/home/home_screen.dart';
import 'package:salon_app/screens/maps/maps_screen.dart';
import 'package:salon_app/screens/profile/profile_screen.dart';

class BottomNavigationComponent extends StatefulWidget {
  const BottomNavigationComponent({super.key});

  @override
  State<BottomNavigationComponent> createState() =>
      _BottomNavigationComponentState();
}

class _BottomNavigationComponentState extends State<BottomNavigationComponent> {
  List<Widget> screens = [
    const HomeScreen(),
    const MapsPage(),
    const BookingScreen(),
    const ProfileScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff721c80),
                ),
                label: 'Home',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xff721c80),
                ),
                label: 'Visit',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.edit_calendar_outlined,
                  color: Color(0xff721c80),
                ),
                label: 'Book',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Color(0xff721c80),
                ),
                label: 'Profile',
                backgroundColor: Colors.white),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 26,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
