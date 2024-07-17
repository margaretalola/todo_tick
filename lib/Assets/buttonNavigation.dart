import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todotick/Task/task.dart';
import 'AppState.dart';
import '../Homepage/homepage.dart';

class Buttonnavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, child) {
        return BottomNavigationBar(
          currentIndex: appState.selectedIndex,
          onTap: (index) {
            appState?.setSelectedIndex(index);
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TaskPage()),
                );
                break;
              case 2:
              // page calendar
                break;
              case 3:
              // page profile
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.indigo[700],
          unselectedItemColor: Colors.grey,
        );
      },
    );
  }
}