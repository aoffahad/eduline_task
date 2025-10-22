import 'package:eduline/presentation/screens/posts_screen/view/api_data_viewer.dart';
import 'package:eduline/presentation/screens/posts_screen/view/local_database_data_viewer.dart';
import 'package:flutter/material.dart';

class HandlerScreen extends StatefulWidget {
  const HandlerScreen({super.key});

  @override
  State<HandlerScreen> createState() => _HandlerScreenState();
}

class _HandlerScreenState extends State<HandlerScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [ApiCallingScreen(), LocalDatabaseScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11161f),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            // color: const Color(0xff11161f),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0xff11161f),
                offset: Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff1d1f24),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.white70,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.download), label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
