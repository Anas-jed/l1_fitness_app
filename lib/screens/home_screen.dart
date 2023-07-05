import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:l1_fitness_app/exports_all.dart';
import 'package:l1_fitness_app/screens/tabs/feed_tab.dart';
import 'package:l1_fitness_app/screens/tabs/menu_tab.dart';
import 'package:l1_fitness_app/screens/tabs/progress_tab.dart';
import 'package:l1_fitness_app/screens/tabs/store_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Future startHomeScreen({required BuildContext context}) async {
    if (Platform.isAndroid) {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      return Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: customBlue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.grey.shade200,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          iconSize: 22,
          onTap: (value) => setState(() {
                if (value != 2) {
                  currentIndex = value;
                }
              }),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/feed.svg',
                  colorFilter: currentIndex == 0
                      ? const ColorFilter.mode(customBlue, BlendMode.srcIn)
                      : null),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/progress.svg',
                  colorFilter: currentIndex == 1
                      ? const ColorFilter.mode(customBlue, BlendMode.srcIn)
                      : null),
              label: 'Progress',
            ),
            BottomNavigationBarItem(
              icon: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: customBlue),
                height: 45,
                width: 45,
                child: Image.asset(
                  'assets/images/white_logo.png',
                  // color: black,
                  height: 30,
                  width: 30,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/store.svg',
                  colorFilter: currentIndex == 3
                      ? const ColorFilter.mode(customBlue, BlendMode.srcIn)
                      : null),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/menu.svg',
                  colorFilter: currentIndex == 4
                      ? const ColorFilter.mode(customBlue, BlendMode.srcIn)
                      : null),
              label: 'Menu',
            ),
          ]),
      body: Center(
          child: [
        const FeedTab(),
        const ProgressTab(),
        const Placeholder(),
        const StoreTab(),
        const MenuTab()
      ].elementAt(currentIndex)),
    );
  }
}
